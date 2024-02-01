defmodule MyApp.Generics.Change do
  alias MyApp.Schemas

  def call(schema_name, instance, params) do
    module = Schemas.call(schema_name).module
    instance
    |> module.changeset(params)
  end
end
