defmodule Example do
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
