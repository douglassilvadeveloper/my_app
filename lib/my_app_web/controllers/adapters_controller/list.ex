defmodule MyAppWeb.AdaptersController.List do
  use MyAppWeb, :controller

  alias MyApp

  def call(schema_name, conn, _params) do
    data = MyApp.list(schema_name)
    render(conn, :index, data: data)
  end

end
