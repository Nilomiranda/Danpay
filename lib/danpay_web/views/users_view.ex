defmodule DanpayWeb.UsersView do
  alias Danpay.User

  def render("create.json", %{user: %User{id: id, nickname: nickname, name: name}}) do
    %{
      user: %{
        id: id,
        name: name,
        nickname: nickname
      }
    }
  end
end
