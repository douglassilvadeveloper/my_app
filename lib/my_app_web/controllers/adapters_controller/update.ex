defmodule MyAppWeb.AdaptersController.Update do
  use MyAppWeb, :controller

  alias MyApp

  def call(schema_name, conn, id, params) do
    instance = MyApp.show(schema_name, id)

    with {:ok, instance} <- MyApp.update(schema_name, instance, params) do
      render(conn, :show, data: instance)
    end
  end

end
