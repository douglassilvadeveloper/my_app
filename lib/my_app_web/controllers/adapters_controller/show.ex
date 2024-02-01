defmodule MyAppWeb.AdaptersController.Show do
  use MyAppWeb, :controller

  alias MyApp

  def call(schema_name, conn, id) do
    data = MyApp.show(schema_name, id)
    render(conn, :show, data: data)
  end

end
