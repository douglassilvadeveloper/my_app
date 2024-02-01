defmodule MyApp.Schemas do
  @schemas %{
    pessoas: %{
      module: MyApp.Pessoas.Pessoa
    },
    pessoas_fisicas: %{
      module: MyApp.Pessoas.PessoaFisica
    }
  }

  def call(schema_name) do
    @schemas[schema_name]
  end
end
