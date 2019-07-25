# module custom_operators.ex

defmodule MyOperators do
    def a ~> b, do: max(a, b)
    def a <~ b, do: min(a, b)
end