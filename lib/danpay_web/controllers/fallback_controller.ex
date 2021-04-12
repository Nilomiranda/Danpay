defmodule DanpayWeb.FallbackController do
  use DanpayWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(DanpayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
