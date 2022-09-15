defmodule PokemonTest do
  use ExUnit.Case

  import Mox

  setup :verify_on_exit!

  describe "get_pokemon/1" do
    test "should return the infos of the inserted pokemon" do
      expect(PokemonMock, :get_pokemon, fn _args ->
        %{
          abilities: ["static", "lightning-rod"],
          height: 4,
          name: "pikachu",
          number: 25,
          weight: 60
        }
      end)

      assert %{name: name} = ClientPokemon.get_pokemon("pikachu")

      assert name == "pikachu"
    end
  end
end
