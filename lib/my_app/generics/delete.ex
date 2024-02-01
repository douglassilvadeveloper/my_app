defmodule MyApp.Generics.Delete do
  import Ecto.Query, warn: false
  alias MyApp.Repo

  def call(instance), do: Repo.delete(instance)
end
