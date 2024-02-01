defmodule MyApp.Repo.Migrations.CreatePessoasFisicas do
  use Ecto.Migration

  def change do
    create table(:pessoas_fisicas) do
      add :cpf, :string
      add :pessoa_id, references(:pessoas, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:pessoas_fisicas, [:pessoa_id])
  end
end
