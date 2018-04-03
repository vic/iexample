# IExample - Elixir formatted documentation examples.

[![Travis](https://img.shields.io/travis/vic/iexample.svg)](https://travis-ci.org/vic/iexample)
[![Hex.pm](https://img.shields.io/hexpm/v/iexample.svg?style=flat-square)](https://hexdocs.pm/iexample)

## Usage

Just interpolate the result of `iexample` into your documentation strings.

Note that for this to work, your docs should allow interpolation (dont use `~S`)
*and* the interpolation should happen at the start of a new line.

The `iexample/2` macro takes the expression result and a code block, and simply generates
an iex example string.

The following code from `test/support/example.ex`, would generate:

```
iex> 12 * 3
36
```

```elixir
defmodule MyModule do
  import IExample

  @moduledoc """
  Math works

  #{
    iexample(36) do
      12 * 3
    end
  }
  """
end
```


Then just run `mix format` and the interpolated code should be formatted for you nicely.


## Installation

```elixir
def deps do
  [
    {:iexample, "~> 0.1"}
  ]
end
```

Documentation can be found at [https://hexdocs.pm/iexample](https://hexdocs.pm/iexample).

