defmodule Danpay.Repo do
  use Ecto.Repo,
    otp_app: :danpay,
    adapter: Ecto.Adapters.Postgres
end
