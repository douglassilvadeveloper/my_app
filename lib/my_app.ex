defmodule MyApp do

  # Generics Operations
  alias MyApp.Generics.{Change, Create, Delete, EmptyInstance, List, Show, Update, }

  # Operations
  defdelegate build_empty_instance(schema_name), to: EmptyInstance, as: :call
  defdelegate change(schema_name, instance, params), to: Change, as: :call
  defdelegate create(schema_name, params), to: Create, as: :call
  defdelegate delete(instance), to: Delete, as: :call
  defdelegate list(schema_name), to: List, as: :call
  defdelegate show(schema_name, id), to: Show, as: :call
  defdelegate update(schema_name, instance, params), to: Update, as: :call
end
