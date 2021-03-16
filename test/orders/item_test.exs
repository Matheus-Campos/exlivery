defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "when all params are valid, returns an item" do
      response = Item.build("Pizza de frango com catupiry", :pizza, "32.90", 1)

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there is an invalid category, returns an item" do
      response = Item.build("Pizza de frango com catupiry", :banana, "32.90", 1)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when there is an invalid price, returns an item" do
      response = Item.build("Pizza de frango com catupiry", :pizza, "banana", 1)

      expected_response = {:error, "Invalid price"}

      assert response == expected_response
    end

    test "when there is an invalid quantity, returns an item" do
      response = Item.build("Pizza de frango com catupiry", :pizza, "32.90", 0)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
