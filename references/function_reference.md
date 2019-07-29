# Functions Reference

## Anonymous Functions

```elixir
iex(6)> plus_one = fn (x) -> x + 1 end
#Function<7.91303403/1 in :erl_eval.expr/5>
iex(7)> plus_one.(10)
11
```

> **NOTE:**
> Theres no return in Elixir, the return value it's the last expresion value

## Anonymous Functions with multiple implementations

```elixir
iex(2)> division = fn 
...(2)>   (_dividend, 0) -> :infinity
...(2)>   (dividend, divisor) -> dividend / divisor
...(2)> end
#Function<13.91303403/2 in :erl_eval.expr/5>
iex(3)> division.(10, 2)
5.0
iex(4)> division.(10, 0)
:infinity
```

## Accessing variables from outerscope

```elixir
iex(5)> x = 3
3
iex(6)> some_fun = fn -> "varible s is #{x}" end
#Function<21.91303403/0 in :erl_eval.expr/5>
iex(7)> some_fun.()
"varible s is 3"
iex(8)> x = 5
5
iex(9)> some_fun.()
"varible s is 3"
```

## The Capture Operator "&"

```elixir
iex(1)> plus_one = &(&1 + 1)
#Function<7.91303403/1 in :erl_eval.expr/5>
iex(2)> plus_one.(10)
11
```

> **NOTE 1:**
> Parentheses are optional, but it's better to use them because they
> improve legibility

> **NOTE 2:**
> Besides to be a way to declare lambda funtions, the capture operator
> can be used with named functions.


## Modules and Named Functions

```elixir
iex(1)> defmodule StringHelper do
...(1)>   def palindrome?(term) do
...(1)>     String.reverse(term) == term
...(1)>   end
...(1)> end
{:module, StringHelper,
 <<70, 79, 82, 49, 0, 0, 4, 156, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 0, 163,
   0, 0, 0, 16, 19, 69, 108, 105, 120, 105, 114, 46, 83, 116, 114, 105, 110,
   103, 72, 101, 108, 112, 101, 114, 8, 95, 95, ...>>, {:palindrome?, 1}}
iex(2)> StringHelper.palindrome?("abcd")
false
iex(3)> StringHelper.palindrome?("abba")
true
```

> **NOTE 1:**
> Named functions must be declared within module.

> **NOTE 2:**
> Functions names starts with lowercase, named with snake_case

> **NOTE 3:**
> Functions may end with **?** or **!**, this is by convention:
> **!** denote that the function **may raise an error** and 
> whereas function names ending with **?** indicate it will return
> **true** or **false**.

### Same example but with do: ... end syntax

```elixir
iex(1)> defmodule StringHelper do
...(1)>   def palindrome?(term), do: String.reverse(term) == term end
{:module, StringHelper,
 <<70, 79, 82, 49, 0, 0, 4, 152, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 0, 163,
   0, 0, 0, 16, 19, 69, 108, 105, 120, 105, 114, 46, 83, 116, 114, 105, 110,
   103, 72, 101, 108, 112, 101, 114, 8, 95, 95, ...>>, {:palindrome?, 1}}
iex(2)> StringHelper.palindrome?("abcd")
true
iex(3)> StringHelper.palindrome?("abba")
false
```