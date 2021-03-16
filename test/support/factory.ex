defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.Item
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

  def item_factory do
    %Item{
      category: :pizza,
      description: "Pizza de frango com catupiry",
      quantity: 1,
      unity_price: Decimal.new("32.90")
    }
  end
end
