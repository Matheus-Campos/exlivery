defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
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

  def order_factory do
    %Order{
      delivery_address: "Rua dos mafagafos, 22",
      items: [
        build(:item),
        build(:item,
          description: "Temaki de atum",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("20.50")
        )
      ],
      total_price: Decimal.new("73.90"),
      user_cpf: "12345678911"
    }
  end
end
