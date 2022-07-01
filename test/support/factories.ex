defmodule Factories do
  defmacro __using__(_opts) do
    quote do
      use ExMachina
      use Blunt.Data.Factories
      use Factories.CommandedFactories
    end
  end
end
