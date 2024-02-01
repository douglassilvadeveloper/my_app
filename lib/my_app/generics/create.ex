defmodule MyApp.Generics.Create do
  import Ecto.Query, warn: false
  alias MyApp.Repo
  alias MyApp.Schemas


  def call(schema_name, params) do
    module = Schemas.call(schema_name).module

    params
    |> module.changeset()
    |> Repo.insert()
  end
end
