defmodule MyAppWeb.AdaptersController.Delete do
  use MyAppWeb, :controller

  alias MyApp

  def call(schema_name, conn, id) do
    instance = MyApp.show(schema_name, id)
    with {:ok, _instance} <- MyApp.delete(instance) do
      send_resp(conn, :no_content, "")
    end
  end

end
