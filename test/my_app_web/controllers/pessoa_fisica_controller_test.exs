defmodule MyAppWeb.PessoaFisicaControllerTest do
  use MyAppWeb.ConnCase

  import MyApp.PessoasFixtures

  alias MyApp.Pessoas.PessoaFisica

  @create_attrs %{
    cpf: "some cpf"
  }
  @update_attrs %{
    cpf: "some updated cpf"
  }
  @invalid_attrs %{cpf: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all pessoas_fisicas", %{conn: conn} do
      conn = get(conn, ~p"/api/pessoas_fisicas")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create pessoa_fisica" do
    test "renders pessoa_fisica when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/pessoas_fisicas", pessoa_fisica: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/pessoas_fisicas/#{id}")

      assert %{
               "id" => ^id,
               "cpf" => "some cpf"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/pessoas_fisicas", pessoa_fisica: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update pessoa_fisica" do
    setup [:create_pessoa_fisica]

    test "renders pessoa_fisica when data is valid", %{conn: conn, pessoa_fisica: %PessoaFisica{id: id} = pessoa_fisica} do
      conn = put(conn, ~p"/api/pessoas_fisicas/#{pessoa_fisica}", pessoa_fisica: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/pessoas_fisicas/#{id}")

      assert %{
               "id" => ^id,
               "cpf" => "some updated cpf"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, pessoa_fisica: pessoa_fisica} do
      conn = put(conn, ~p"/api/pessoas_fisicas/#{pessoa_fisica}", pessoa_fisica: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete pessoa_fisica" do
    setup [:create_pessoa_fisica]

    test "deletes chosen pessoa_fisica", %{conn: conn, pessoa_fisica: pessoa_fisica} do
      conn = delete(conn, ~p"/api/pessoas_fisicas/#{pessoa_fisica}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/pessoas_fisicas/#{pessoa_fisica}")
      end
    end
  end

  defp create_pessoa_fisica(_) do
    pessoa_fisica = pessoa_fisica_fixture()
    %{pessoa_fisica: pessoa_fisica}
  end
end
