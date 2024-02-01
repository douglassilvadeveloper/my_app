defmodule MyApp.Generics.Show do
  import Ecto.Query, warn: false
  alias MyApp.Repo
  alias MyApp.Schemas

  def call(schema_name, id) do
    schema = Schemas.call(schema_name).module
    Repo.get!(schema, id)
  end
end
