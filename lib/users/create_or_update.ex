defmodule Exlivery.Users.CreateOrUpdate do
  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.User

  def call(%{name: name, address: address, cpf: cpf, email: email, age: age}) do
    name
    |> User.build(email, cpf, age, address)
    |> save_user()
  end

  defp save_user({:ok, %User{} = user}), do: {UserAgent.save(user), user}
  defp save_user({:error, _reason} = error), do: error
end
