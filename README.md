# Monet

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `monet` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:monet, "~> 0.1.0"}
  ]
end
```

## Building

``` shell
[msrinivasa:~/develop/monet] mix deps.get
[msrinivasa:~/develop/monet] MIX_ENV=prod mix distillery.release
```

## Running

In one terminal window, start the application as user ``kate``

``` shell
[msrinivasa:~/develop/monet] REPLACE_OS_VARS=true USER_NAME=kate
_build/prod/rel/monet/bin/monet foreground
kate@127.0.0.1
```

In a second terminal window, start the application as user ``alex``

``` shell
[msrinivasa:~/develop/monet] REPLACE_OS_VARS=true USER_NAME=alex
_build/prod/rel/monet/bin/monet foreground
alex@127.0.0.1
```

In ``kate``'s shell, you will see a message -

``` shell
[msrinivasa:~/develop/monet] REPLACE_OS_VARS=true USER_NAME=kate
_build/prod/rel/monet/bin/monet foreground
kate@127.0.0.1
Kate, do you copy?
```


Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/monet](https://hexdocs.pm/monet).

