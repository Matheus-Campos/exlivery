defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Matheus Campos",
      email: "silva.campos.matheus@gmail.com",
      cpf: "12345678911",
      age: 22,
      address: "Rua dos mafagafos, 22"
    }
  end
end
