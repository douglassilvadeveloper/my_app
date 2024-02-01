defmodule MyAppWeb.PessoaJSON do
  alias MyApp.Pessoas.Pessoa

  @doc """
  Renders a list of pessoas.
  """
  def index(%{data: pessoas}) do
    %{data: for(pessoa <- pessoas, do: data(pessoa))}
  end

  @doc """
  Renders a single pessoa.
  """
  def show(%{data: pessoa}) do
    %{data: data(pessoa)}
  end

  defp data(%Pessoa{} = pessoa) do
    %{
      id: pessoa.id,
      nome: pessoa.nome
    }
  end
end
