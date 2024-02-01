defmodule MyAppWeb.AdaptersController.Create do
  use MyAppWeb, :controller

  alias MyApp

  def call(schema_name, conn, params) do
    schema_name_string = to_string(schema_name)

    case MyApp.create(schema_name, params) do
      {:ok, instance} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", "/api/#{schema_name_string}/#{instance.id}")
        |> render(:show, data: instance)

      {:error, reason} ->
        conn
        |> put_status(:bad_request)
        |> render(:error, reason: reason)
    end
  end
end
