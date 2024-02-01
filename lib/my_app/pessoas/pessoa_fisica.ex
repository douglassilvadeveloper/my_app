defmodule MyApp.Pessoas.PessoaFisica do
  use Ecto.Schema
  import Ecto.Changeset

  alias MyApp.Pessoas.Pessoa

  schema "pessoas_fisicas" do
    field :cpf, :string

    belongs_to :pessoa, Pessoa

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(pessoa_fisica \\ %__MODULE__{}, attrs) do
    pessoa_fisica
    |> cast(attrs, [:cpf])
    |> validate_required([:cpf])
  end

  def empty_instance, do: %__MODULE__{}
end
