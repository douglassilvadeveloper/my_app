defmodule MyAppWeb.PessoaController do
  use MyAppWeb, :controller

  alias MyAppWeb.AdaptersController.{List, Show, Delete, Update, Create}

  action_fallback MyAppWeb.FallbackController

  def index(conn, params), do: List.call(:pessoas, conn, params)
  def show(conn, %{"id" => id}), do: Show.call(:pessoas, conn, id)
  def delete(conn, %{"id" => id}), do: Delete.call(:pessoas, conn, id)
  def update(conn, %{"id" => id, "data" => params}), do: Update.call(:pessoas, conn, id, params)
  def create(conn, %{"data" => params}), do: Create.call(:pessoas, conn, params)

end
