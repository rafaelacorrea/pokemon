Mox.defmock(PokemonMock, for: ClientPokemon)
Application.put_env(:client_pokemon, :pokemon, PokemonMock)
ExUnit.start()
