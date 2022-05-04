defmodule ExMon.Trainer.Pokemon.All do
  alias ExMon.{Repo, Trainer}
  alias Ecto.UUID

  def call(%{"trainers_id" => id}) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Trainer, uuid) do
      nil -> {:error, "Trainer not Found"}
      trainer -> {:ok, Repo.preload(trainer, :pokemon)}
    end
  end
end
