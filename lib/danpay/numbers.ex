defmodule Danpay.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, read_result}) do
    sum = read_result
    |> String.split(",")
    |> Enum.map(fn number -> String.to_integer(number) end)
    |> Enum.sum()

    {:ok, %{result: sum}}
  end

  defp handle_file({:error, _error}), do: {:error, "Invalid file format"}
end
