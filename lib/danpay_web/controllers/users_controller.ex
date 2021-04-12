defmodule DanpayWeb.UsersController do
  use DanpayWeb, :controller

  alias Danpay.User

  action_fallback DanpayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Danpay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
