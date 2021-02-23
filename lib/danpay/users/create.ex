defmodule Danpay.Users.Create do
  alias Danpay.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
