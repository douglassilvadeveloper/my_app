defmodule MyAppWeb.PessoaFisicaJSON do
  alias MyApp.Pessoas.PessoaFisica

  @doc """
  Renders a list of pessoas_fisicas.
  """
  def index(%{data: pessoas_fisicas}) do
    %{data: for(pessoa_fisica <- pessoas_fisicas, do: data(pessoa_fisica))}
  end

  @doc """
  Renders a single pessoa_fisica.
  """
  def show(%{data: pessoa_fisica}) do
    %{data: data(pessoa_fisica)}
  end

  defp data(%PessoaFisica{} = pessoa_fisica) do
    %{
      id: pessoa_fisica.id,
      cpf: pessoa_fisica.cpf
    }
  end
end
