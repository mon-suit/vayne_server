defmodule Vayne.Server.Metric do

  require Logger

  def init_metrics do

    #load task success
    :ok = :folsom_metrics.new_counter("load_task")

    #load error msg count
    :ok = :folsom_metrics.new_gauge("error_count")

    #local task count
    :ok = :folsom_metrics.new_gauge("task_count")

  end

  def report_metrics do
    {:ok, hostname} = :inet.gethostname
    hostname        = to_string(hostname)
    metrics         = get_metrics()
    params          = %{"endpoint" => hostname, "step" => 60}
    tag             = %{"app" => "vayne_server", "area" => Application.get_env(:vayne_server, :area)}

    if Code.ensure_loaded?(Vayne.Export.OpenFalcon) do
      ret = Vayne.Export.OpenFalcon.run(params, {tag, metrics})
      Logger.info "Report metric ret: #{inspect ret}"
    else
      Logger.info "Report metric to console, tag: #{inspect tag}, metric: #{inspect metrics}"
    end
  end

  def update_metrics do
    #update error msg count
    {:ok, errors} = Vayne.Error.query_time_local(180)

    err_count = errors
    |> Enum.map(fn {task, err, _time} -> {task, err} end)
    |> Enum.uniq
    |> length

    :folsom_metrics.notify("error_count", err_count)

    #update task count
    tasks = Vayne.Manager.local_tasks() |> Map.values |> List.flatten
    :folsom_metrics.notify("task_count", length(tasks))
  end

  def get_metrics do
    Map.merge(sysinfo(), %{
      "error_count" => :folsom_metrics.get_metric_value("error_count"),
      "task_count"  => :folsom_metrics.get_metric_value("task_count"),
      "load_task"   => :folsom_metrics.get_metric_value("load_task")
    })
  end

  defp sysinfo do
    %{} |> sysinfo_port() |> sysinfo_process() |> sysinfo_ets() |> sysinfo_memory
  end

  defp sysinfo_port(acc) do
    port_limit   = :erlang.system_info(:port_limit)
    port_count   = Port.list |> length
    port_percent = Float.floor(100 * port_count / port_limit, 2)

    acc
    |> Map.put("erlang.port.count", port_count)
    |> Map.put("erlang.port.limit", port_limit)
    |> Map.put("erlang.port.percent", port_percent)
  end

  defp sysinfo_process(acc) do
    process_limit   = :erlang.system_info(:process_limit)
    process_count   = Process.list |> length
    process_percent = Float.floor(100 * process_count / process_limit, 2)

    acc
    |> Map.put("erlang.process.count", process_count)
    |> Map.put("erlang.process.limit", process_limit)
    |> Map.put("erlang.process.percent", process_percent)
  end

  defp sysinfo_ets(acc) do
    ets_limit   = :erlang.system_info(:ets_limit)
    ets_count   = :ets.all |> length
    ets_percent = Float.floor(100 * ets_count / ets_limit, 2)
    acc
    |> Map.put("erlang.ets.count", ets_count)
    |> Map.put("erlang.ets.limit", ets_limit)
    |> Map.put("erlang.ets.percent", ets_percent)
  end

  defp sysinfo_memory(acc) do
    :erlang.memory |> Enum.reduce(acc, fn ({k, v}, acc) ->
      Map.put(acc, "erlang.memory.#{k}", v)
    end)
  end
end
