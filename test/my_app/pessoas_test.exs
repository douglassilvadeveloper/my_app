defmodule MyApp.PessoasTest do
  use MyApp.DataCase

  alias MyApp.Pessoas

  describe "pessoas" do
    alias MyApp.Pessoas.Pessoa

    import MyApp.PessoasFixtures

    @invalid_attrs %{nome: nil}

    test "list_pessoas/0 returns all pessoas" do
      pessoa = pessoa_fixture()
      assert Pessoas.list_pessoas() == [pessoa]
    end

    test "get_pessoa!/1 returns the pessoa with given id" do
      pessoa = pessoa_fixture()
      assert Pessoas.get_pessoa!(pessoa.id) == pessoa
    end

    test "create_pessoa/1 with valid data creates a pessoa" do
      valid_attrs = %{nome: "some nome"}

      assert {:ok, %Pessoa{} = pessoa} = Pessoas.create_pessoa(valid_attrs)
      assert pessoa.nome == "some nome"
    end

    test "create_pessoa/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pessoas.create_pessoa(@invalid_attrs)
    end

    test "update_pessoa/2 with valid data updates the pessoa" do
      pessoa = pessoa_fixture()
      update_attrs = %{nome: "some updated nome"}

      assert {:ok, %Pessoa{} = pessoa} = Pessoas.update_pessoa(pessoa, update_attrs)
      assert pessoa.nome == "some updated nome"
    end

    test "update_pessoa/2 with invalid data returns error changeset" do
      pessoa = pessoa_fixture()
      assert {:error, %Ecto.Changeset{}} = Pessoas.update_pessoa(pessoa, @invalid_attrs)
      assert pessoa == Pessoas.get_pessoa!(pessoa.id)
    end

    test "delete_pessoa/1 deletes the pessoa" do
      pessoa = pessoa_fixture()
      assert {:ok, %Pessoa{}} = Pessoas.delete_pessoa(pessoa)
      assert_raise Ecto.NoResultsError, fn -> Pessoas.get_pessoa!(pessoa.id) end
    end

    test "change_pessoa/1 returns a pessoa changeset" do
      pessoa = pessoa_fixture()
      assert %Ecto.Changeset{} = Pessoas.change_pessoa(pessoa)
    end
  end

  describe "pessoas_fisicas" do
    alias MyApp.Pessoas.PessoaFisica

    import MyApp.PessoasFixtures

    @invalid_attrs %{cpf: nil}

    test "list_pessoas_fisicas/0 returns all pessoas_fisicas" do
      pessoa_fisica = pessoa_fisica_fixture()
      assert Pessoas.list_pessoas_fisicas() == [pessoa_fisica]
    end

    test "get_pessoa_fisica!/1 returns the pessoa_fisica with given id" do
      pessoa_fisica = pessoa_fisica_fixture()
      assert Pessoas.get_pessoa_fisica!(pessoa_fisica.id) == pessoa_fisica
    end

    test "create_pessoa_fisica/1 with valid data creates a pessoa_fisica" do
      valid_attrs = %{cpf: "some cpf"}

      assert {:ok, %PessoaFisica{} = pessoa_fisica} = Pessoas.create_pessoa_fisica(valid_attrs)
      assert pessoa_fisica.cpf == "some cpf"
    end

    test "create_pessoa_fisica/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pessoas.create_pessoa_fisica(@invalid_attrs)
    end

    test "update_pessoa_fisica/2 with valid data updates the pessoa_fisica" do
      pessoa_fisica = pessoa_fisica_fixture()
      update_attrs = %{cpf: "some updated cpf"}

      assert {:ok, %PessoaFisica{} = pessoa_fisica} = Pessoas.update_pessoa_fisica(pessoa_fisica, update_attrs)
      assert pessoa_fisica.cpf == "some updated cpf"
    end

    test "update_pessoa_fisica/2 with invalid data returns error changeset" do
      pessoa_fisica = pessoa_fisica_fixture()
      assert {:error, %Ecto.Changeset{}} = Pessoas.update_pessoa_fisica(pessoa_fisica, @invalid_attrs)
      assert pessoa_fisica == Pessoas.get_pessoa_fisica!(pessoa_fisica.id)
    end

    test "delete_pessoa_fisica/1 deletes the pessoa_fisica" do
      pessoa_fisica = pessoa_fisica_fixture()
      assert {:ok, %PessoaFisica{}} = Pessoas.delete_pessoa_fisica(pessoa_fisica)
      assert_raise Ecto.NoResultsError, fn -> Pessoas.get_pessoa_fisica!(pessoa_fisica.id) end
    end

    test "change_pessoa_fisica/1 returns a pessoa_fisica changeset" do
      pessoa_fisica = pessoa_fisica_fixture()
      assert %Ecto.Changeset{} = Pessoas.change_pessoa_fisica(pessoa_fisica)
    end
  end
end
