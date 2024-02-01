defmodule MyApp.Generics.Update do
  import Ecto.Query, warn: false
  alias MyApp.Repo
  alias MyApp.Schemas

  def call(schema_name, instance, params) do
    module = Schemas.call(schema_name).module

    instance
    |> module.changeset(params)
    |> Repo.update()
  end
end
