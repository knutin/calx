defmodule Calx do
  def go string do
    {:ok, tokens, _} = :calx_lexer.string(string)
    {:ok, syntax_tree} = :calx_parser.parse(tokens)
    reduce syntax_tree
  end


  def reduce expr do
    reduce expr, 0
  end

  defp reduce {:expr, operator, args}, initial_acc do
    Enum.reduce(args, initial_acc, fn (e, acc) ->
      case e do
        {:digit, i} ->
          apply_operator(operator, acc, i)
        {:expr, _, _} = e ->
          apply_operator(operator, acc, reduce(e))
      end
    end)
  end

  defp apply_operator op, l, r do
    case op do
      '+' -> l + r
      '-' -> l - r
    end
  end
end
