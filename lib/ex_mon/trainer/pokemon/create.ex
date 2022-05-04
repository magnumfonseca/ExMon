defmodule ExMon.Trainer.Pokemon.Create do
  alias ExMon.{Repo, Pokemon}
  alias ExMon.PokeApi.Client
  alias ExMon.Trainer.Pokemon, as: TrainerPokemon

  def call(%{"name" => name} = params) do
    name
    |> Client.get_pokemon()
    |> handle_response(params)
  end

  defp handle_response({:ok, body}, params) do
    body
    |> Pokemon.build()
    |> create_pokemon(params)
  end

  defp handle_response({:error, _response} = error, _params), do: error

  defp create_pokemon(%Pokemon{name: name, weight: weight, types: types, sprites: sprites}, %{
    "nick_name" => nick_name,
    "trainers_id" => trainer_id
  }) do
    %{
      name: name,
      weight: weight,
      types: types,
      nick_name: nick_name,
      trainer_id: trainer_id,
      sprites: sprites
    }
    |> TrainerPokemon.build()
    |> handle_build()
  end

  defp handle_build({:ok, pokemon}), do: Repo.insert(pokemon)
  defp handle_build({:error, _changeset} = error), do: error
end
