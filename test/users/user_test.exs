defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "Matheus Campos",
          "silva.campos.matheus@gmail.com",
          "12345678911",
          22,
          "Rua dos mafagafos, 22"
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when age is below 18, returns an error" do
      response =
        User.build(
          "Matheus Campos",
          "silva.campos.matheus@gmail.com",
          "12345678911",
          17,
          "Rua dos mafagafos, 22"
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when cpf is not a string, returns an error" do
      response =
        User.build(
          "Matheus Campos",
          "silva.campos.matheus@gmail.com",
          12_345_678_911,
          18,
          "Rua dos mafagafos, 22"
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
