defmodule ExMon.Pokemon do
  @keys [:id, :name, :weight, :types, :sprites]
  @enforce_keys @keys

  @derive Jason.Encoder
  defstruct @keys

  def build(%{"id" => id, "name" => name, "weight" => weight, "types" => types, "sprites" => sprites}) do
    %__MODULE__{
      id: id,
      name: name,
      weight: weight,
      types: parse_types(types),
      sprites: parse_spites(sprites)
    }
  end

  def parse_types(types), do: Enum.map(types, fn item -> item["type"]["name"] end)
  def parse_spites(sprites), do: sprites["front_default"]
end
