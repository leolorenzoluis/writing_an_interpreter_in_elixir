defmodule Monkey.Ast.IndexExpression do
  alias Monkey.Ast.Node

  @enforce_keys [:token, :left, :index]
  defstruct [:token,
             :left, # expression
             :index #expression
            ]

  defimpl Node, for: __MODULE__ do
    def token_literal(expression), do: expression.token.literal

    def node_type(_), do: :expression

    def to_string(expression) do
      out = [
        "(",
        Node.to_string(expression.left),
        "[",
        Node.to_string(expression.index),
        "])"
      ]

      Enum.join(out)
    end
  end
end
