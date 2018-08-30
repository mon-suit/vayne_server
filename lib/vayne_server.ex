defmodule Vayne.Server do

  def load_task do
    area    = Application.get_env(:vayne_server, :area)
    addr    = Application.get_env(:vayne_server, :center_addr)
    timeout = Application.get_env(:vayne_server, :load_timeout, :timer.seconds(10))

    res   = HTTPotion.get!("#{addr}/tasks/#{area}", timeout: timeout)
    tasks = res.body |> Cipher.decrypt |> :erlang.binary_to_term

    push_task(:from_center, tasks)
  end

  @max_retry 5
  def push_task(group, tasks, retry \\ 0) do
    try do
      Vayne.Manager.push_task(group, tasks)
    catch
      :exit, _ ->
        if retry >= @max_retry do
          {:error, "Vayne.Manager is not running"}
        else
          Process.sleep(2_000)
          push_task(group, tasks, retry + 1)
        end
    end
  end

end
