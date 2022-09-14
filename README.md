# Pokemon

It is a app used to return the infos of a pokemon.

## Installation

```bash
git clone git@github.com:rafaelacorrea/pokemon.git
mix deps.get
```

## Run

```bash
iex -S mix
```
```elixir
iex>  Pokemon.get_pokemon "pikachu"
%{
  abilities: ["static", "lightning-rod"],
  height: 4,
  name: "pikachu",
  number: 25,
  weight: 60
}
```