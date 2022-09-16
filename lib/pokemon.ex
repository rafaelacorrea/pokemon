defmodule Pokemon do
  @behaviour ClientPokemon

  @impl ClientPokemon
  def get_pokemon(pokemon) do
    pokemon = URI.encode(pokemon)

    "https://pokeapi.co/api/v2/pokemon/#{pokemon}"
    |> HTTPoison.get()
    |> parser_response()
    |> build_pokemon_params()
  end

  defp parser_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    json = body |> JSON.decode!()
    {:ok, json}
  end

  defp parser_response({:ok, %HTTPoison.Response{body: body, status_code: 404}}) do
    {:error, body}
  end

  defp parser_response(_), do: {:error, "Invalid pokemon"}

  defp build_pokemon_params({:ok, json}) do
    abilities = json["abilities"]

    %{
      number: json["id"],
      name: json["name"],
      height: json["height"],
      weight: json["weight"],
      abilities: get_abilities(abilities)
    }
  end

  defp build_pokemon_params({:error, error}), do: %{error: error}

  defp get_abilities(abilities) do
    abilities
    |> Enum.map(fn abilities ->
      abilities["ability"]["name"]
    end)
  end
end
