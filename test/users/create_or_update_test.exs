defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.{CreateOrUpdate, User}

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Matheus Campos",
        address: "Rua dos mafagafos, 22",
        email: "silva.campos.matheus@gmail.com",
        cpf: "12345678900",
        age: 22
      }

      response = CreateOrUpdate.call(params)

      expected_response =
        {:ok,
         %User{
           address: "Rua dos mafagafos, 22",
           age: 22,
           cpf: "12345678900",
           email: "silva.campos.matheus@gmail.com",
           name: "Matheus Campos"
         }}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Matheus Campos",
        address: "Rua dos mafagafos, 22",
        email: "silva.campos.matheus@gmail.com",
        cpf: "12345678900",
        age: 17
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
