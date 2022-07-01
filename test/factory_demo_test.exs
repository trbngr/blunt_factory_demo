defmodule FactoryDemoTest do
  use ExUnit.Case
  use Factories

  doctest FactoryDemo

  test "factory demo" do
    assert %Commanded.Event.FailureContext{
             application: :factory_demo,
             context: %{},
             handler_name: nil,
             handler_state: %{},
             metadata: %{},
             stacktrace: %{}
           } = build(:failure_context)

    assert %Commanded.Event.FailureContext{context: %{name: "chris"}} =
             build(:failure_context, context: %{name: "chris"})
  end
end
