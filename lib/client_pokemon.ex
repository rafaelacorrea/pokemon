defmodule ClientPokemon do
  @moduledoc false

  @callback get_pokemon(String.t()) :: map()

  def get_pokemon(pokemon) do
    pokemon_client().get_pokemon(pokemon)
  end

  defp pokemon_client() do
    Application.get_env(:client_pokemon, :pokemon, Pokemon)
  end
end
