defmodule MyApp.Pessoas.Pessoa do
  use Ecto.Schema
  import Ecto.Changeset

  alias MyApp.Pessoas.PessoaFisica

  schema "pessoas" do
    field :nome, :string

    has_one :pessoa_fisica, PessoaFisica

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(pessoa \\ %__MODULE__{}, attrs) do
    pessoa
    |> cast(attrs, [:nome])
    |> validate_required([:nome])
  end

  def empty_instance, do: %__MODULE__{}
end
