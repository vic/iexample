defmodule IExample do

  @readme Path.expand("../README.md", __DIR__)
  @external_resource @readme
  @moduledoc File.read!(@readme)

  @doc ~S"""
  Generates a string to be interpolated at a documentation attribute.

  For actual usage example, see `test/support/example.ex`
  """
  defmacro iexample(result, do: body) do
    indent = "    "
    result = Macro.to_string(result)

    example =
      body
      |> Macro.to_string
      |> Code.format_string!
      |> to_string
      |> String.replace(~r/^/, "#{indent}...> ")
      |> String.replace_leading("#{indent}...>", "iex>")

    """
    #{indent}#{example}
    #{indent}#{result}
    """
  end
end
