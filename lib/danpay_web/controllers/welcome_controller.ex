defmodule DanpayWeb.WelcomeController do
  use DanpayWeb, :controller

  alias Danpay.Numbers

  def index(conn, %{"filename" => filename}) do
    filename
    |> Numbers.sum_from_file()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %{result: sum}}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome to Danpay API. Here is yout sum #{sum}"})
  end

  defp handle_response({:error, error_message}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(error_message)
  end
end
