defmodule MyApp.Generics.EmptyInstance do
  alias MyApp.Schemas

  def call(schema_name) do
    Schemas.call(schema_name).module.empty_instance()
  end
end
