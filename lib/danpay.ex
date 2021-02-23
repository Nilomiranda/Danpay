defmodule Danpay do
  alias Danpay.Users.Create, as: UserCreate
  defdelegate create_user(params), to: UserCreate, as: :call
end
