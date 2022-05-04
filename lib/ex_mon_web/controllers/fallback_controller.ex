defmodule ExMonWeb.FallbackController do
  use ExMonWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ExMonWeb.ErrorView)
    |> render("400.json", result: result)
  end

  def call(conn, {:error, :not_found, result}) do
    conn
    |> put_status(:not_found)
    |> put_view(ExMonWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
