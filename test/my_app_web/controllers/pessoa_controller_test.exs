defmodule MyAppWeb.PessoaControllerTest do
  use MyAppWeb.ConnCase

  import MyApp.PessoasFixtures

  alias MyApp.Pessoas.Pessoa

  @create_attrs %{
    nome: "some nome"
  }
  @update_attrs %{
    nome: "some updated nome"
  }
  @invalid_attrs %{nome: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all pessoas", %{conn: conn} do
      conn = get(conn, ~p"/api/pessoas")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create pessoa" do
    test "renders pessoa when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/pessoas", pessoa: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/pessoas/#{id}")

      assert %{
               "id" => ^id,
               "nome" => "some nome"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/pessoas", pessoa: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update pessoa" do
    setup [:create_pessoa]

    test "renders pessoa when data is valid", %{conn: conn, pessoa: %Pessoa{id: id} = pessoa} do
      conn = put(conn, ~p"/api/pessoas/#{pessoa}", pessoa: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/pessoas/#{id}")

      assert %{
               "id" => ^id,
               "nome" => "some updated nome"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, pessoa: pessoa} do
      conn = put(conn, ~p"/api/pessoas/#{pessoa}", pessoa: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete pessoa" do
    setup [:create_pessoa]

    test "deletes chosen pessoa", %{conn: conn, pessoa: pessoa} do
      conn = delete(conn, ~p"/api/pessoas/#{pessoa}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/pessoas/#{pessoa}")
      end
    end
  end

  defp create_pessoa(_) do
    pessoa = pessoa_fixture()
    %{pessoa: pessoa}
  end
end
