defmodule MyApp.Repo.Migrations.CreatePessoas do
  use Ecto.Migration

  def change do
    create table(:pessoas) do
      add :nome, :string

      timestamps(type: :utc_datetime)
    end
  end
end
