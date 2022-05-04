defmodule ExMon.Trainer.Pokemon do
  use Ecto.Schema
  import Ecto.Changeset


  alias ExMon.Trainer

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "pokemons" do
    field :name, :string
    field :nick_name, :string
    field :weight, :integer
    field :sprites, :string
    field :types, {:array, :string}
    belongs_to(:trainer, Trainer)
    timestamps()
  end

  @required [:name, :nick_name, :weight, :types, :trainer_id, :sprites]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required)
    |> validate_required(@required)
    |> assoc_constraint(:trainer)
    |> validate_length(:nick_name, min: 3)
  end

  def update_changeset(pokemon, params) do
    pokemon
    |> cast(params, [:nick_name])
    |> validate_required([:nick_name])
    |> validate_required(:nick_name, min: 3)
  end
end
