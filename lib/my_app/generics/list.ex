defmodule MyApp.Generics.List do
  import Ecto.Query, warn: false
  alias MyApp.Repo
  alias MyApp.Schemas

  def call(schema_name) do
    schema = Schemas.call(schema_name).module
    Repo.all(schema)
  end
end
