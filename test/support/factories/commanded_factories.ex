defmodule Factories.CommandedFactories do
  defmacro __using__(_opts) do
    quote do
      # This factory will build the FailureContext struct
      # It will generate the following function

      # def failure_context_factory(input) do
      #   factory = %Blunt.Data.Factories.Factory{
      #     active_builder: nil,
      #     data: %{},
      #     field_validations: nil,
      #     fields: nil,
      #     final_message: nil,
      #     message_name: nil,
      #     input: input,
      #     name: :failure_context_factory,
      #     opts: [debug: false],
      #     values: [
      #       %Blunt.Data.Factories.Values.Defaults{
      #         values:
      #           Enum.into([application: :factory_demo, handler_state: %{}, handler_name: nil], %{})
      #       },
      #       %Blunt.Data.Factories.Values.Prop{
      #         lazy: false,
      #         field: :stacktrace,
      #         path_func_or_value: fn _data -> %{} end
      #       },
      #       %Blunt.Data.Factories.Values.Prop{field: :context, path_func_or_value: %{}, lazy: true},
      #       %Blunt.Data.Factories.Values.Prop{field: :metadata, path_func_or_value: %{}, lazy: true},
      #       %Blunt.Data.Factories.Values.Prop{
      #         lazy: false,
      #         field: :test_name,
      #         path_func_or_value: fn x1 -> build(:my_test, x1) end
      #       },
      #       %Blunt.Data.Factories.Values.Prop{
      #         lazy: false,
      #         field: :name,
      #         path_func_or_value: [:test_name, :person_name]
      #       }
      #     ],
      #     message: Commanded.Event.FailureContext,
      #     operation: :build,
      #     factory_module: All,
      #     builders: [
      #       Blunt.Data.Factories.Builder.EctoSchemaBuilder,
      #       Blunt.Data.Factories.Builder.StructBuilder,
      #       Blunt.Data.Factories.Builder.MapBuilder
      #     ]
      #   }

      #   Blunt.Data.Factories.Factory.build(factory)
      # end

      factory Commanded.Event.FailureContext, debug: false do
        # set defaults
        defaults application: :factory_demo,
                 handler_state: %{},
                 handler_name: nil

        #  Props and lazy props will  be added to the factory data
        # 1. A function accepting the factory data so far
        # 2. A zero-arity function
        # 3. A list representing the path to the data you want. ie [:context, :some_key_in_context]
        # 4. A plain value that's not a list

        # Props will always be evaluated.
        prop :stacktrace, fn _data ->
          # data is the data accumulated so far
          %{}
        end

        # Lazy prop will only run if the key is not passed to the factory
        lazy_prop :context, %{}
        lazy_prop :metadata, %{}

        # pass along all of the current factory's data
        prop :test_name, &build(:my_test, &1)
        prop :name, [:test_name, :person_name]
      end

      factory :my_test, debug: false do
        prop :person_name, &Faker.Person.name/0
      end
    end
  end
end
