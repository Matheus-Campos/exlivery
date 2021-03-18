defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report

  describe "create/1" do
    test "creates the report file" do
      OrderAgent.start_link(%{})

      build_list(2, :order)
      |> Enum.each(fn order -> OrderAgent.save(order) end)

      Report.create("report_test.csv")

      response = File.read!("report_test.csv")

      expected_response =
        "12345678911,pizza,1,32.90japonesa,2,20.50,73.90\n" <>
        "12345678911,pizza,1,32.90japonesa,2,20.50,73.90\n"

      assert response == expected_response
    end
  end
end
