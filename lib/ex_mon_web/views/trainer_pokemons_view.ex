defmodule ExMonWeb.TrainerPokemonsView do
  use ExMonWeb, :view

  alias ExMon.Trainer.Pokemon

  def render("create.json", %{pokemon: %Pokemon{
    id: id,
    inserted_at: inserted_at,
    name: name,
    nick_name: nick_name,
    sprites: sprites,
    trainer_id: trainer_id,
    types: types,
    weight: weight
  }}) do
    %{
      message: "Pokemon Created",
      pokemon: %{
        id: id,
        inserted_at: inserted_at,
        name: name,
        nick_name: nick_name,
        sprites: sprites,
        trainer_id: trainer_id,
        types: types,
        weight: weight
      }
    }
  end

  def render("show.json", %{pokemon: %Pokemon{
    id: id,
    inserted_at: inserted_at,
    name: name,
    nick_name: nick_name,
    sprites: sprites,
    trainer: %{name: trainer_name},
    types: types,
    weight: weight
  }}) do
    %{
      id: id,
      inserted_at: inserted_at,
      name: name,
      nick_name: nick_name,
      sprites: sprites,
      trainer: %{name: trainer_name},
      types: types,
      weight: weight
    }
  end

  def render("update.json", %{pokemon: %Pokemon{
    id: id,
    inserted_at: inserted_at,
    name: name,
    nick_name: nick_name,
    sprites: sprites,
    trainer_id: trainer_id,
    types: types,
    weight: weight
  }}) do
    %{
      message: "Pokemon Updated",
      pokemon: %{
        id: id,
        inserted_at: inserted_at,
        name: name,
        nick_name: nick_name,
        sprites: sprites,
        trainer_id: trainer_id,
        types: types,
        weight: weight
      }
    }
  end

  def render("index.json", %{pokemon: trainer}) do
    %{
      name: trainer.name,
      pokemons: Enum.map(trainer.pokemon, &pokemon_json/1)
    }
  end

  defp pokemon_json(pokemon) do
    %{
      id: pokemon.id,
      inserted_at: pokemon.inserted_at,
      name: pokemon.name,
      nick_name: pokemon.nick_name,
      sprites: pokemon.sprites,
      types: pokemon.types,
      weight: pokemon.weight

    }
  end
end
