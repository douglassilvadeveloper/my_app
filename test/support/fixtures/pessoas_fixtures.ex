defmodule MyApp.PessoasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyApp.Pessoas` context.
  """

  @doc """
  Generate a pessoa.
  """
  def pessoa_fixture(attrs \\ %{}) do
    {:ok, pessoa} =
      attrs
      |> Enum.into(%{
        nome: "some nome"
      })
      |> MyApp.Pessoas.create_pessoa()

    pessoa
  end

  @doc """
  Generate a pessoa_fisica.
  """
  def pessoa_fisica_fixture(attrs \\ %{}) do
    {:ok, pessoa_fisica} =
      attrs
      |> Enum.into(%{
        cpf: "some cpf"
      })
      |> MyApp.Pessoas.create_pessoa_fisica()

    pessoa_fisica
  end
end
