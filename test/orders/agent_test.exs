defmodule Exlivery.Orders.AgentTest do
  use ExUnit.Case

  alias Exlivery.Orders.Agent, as: OrderAgent

  import Exlivery.Factory

  describe "save/1" do
    test "saves the order" do
      order = build(:order)

      OrderAgent.start_link(%{})

      assert {:ok, _uuid} = OrderAgent.save(order)
    end
  end

  describe "get/1" do
    setup do
      OrderAgent.start_link(%{})

      :ok
    end

    test "when the order is found, returns the order" do
      order = build(:order)

      {:ok, uuid} = OrderAgent.save(order)

      response = OrderAgent.get(uuid)

      expected_response = {:ok, order}

      assert response == expected_response
    end

    test "when the order is not found, returns an error" do
      assert OrderAgent.get("00000000000") == {:error, "Order not found"}
    end
  end
end