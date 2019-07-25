# module redefining_operators.ex

defmodule WrongMath do
    def a + b, do: a - b
end