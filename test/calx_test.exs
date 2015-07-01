defmodule CalxTest do
  use ExUnit.Case
  doctest Calx

  test "lexer" do
    assert {:ok, [{:"(", _, _},
                  {:operator, _, '+'},
                  {:digit, _, '1'},
                  {:digit, _, '2'},
                  {:digit, _, '3'},
                  {:")", _, _}],
            _} = :calx_lexer.string '(+ 1 2 3)'
  end

  test "parser" do
    {:ok, tokens, _} = :calx_lexer.string('(+ 1 2 (- 3))')
    assert {:ok, {:expr, '+', [{:digit, 1},
                               {:digit, 2},
                               {:expr, '-', [{:digit, 3}]}]}
           } = :calx_parser.parse(tokens)
  end

  test "calculator_reduce" do
    assert  6 = Calx.reduce {:expr, '+', [{:digit, 1}, {:digit, 2}, {:digit, 3}]}
    assert -2 = Calx.reduce {:expr, '+', [{:digit, 1}, {:expr, '-', [{:digit, 3}]}]}
  end

  test "calx" do
    assert  6 = Calx.go '(+ 1 2 3)'
    assert  0 = Calx.go '(+ 1 2 (- 3))'
    assert -6 = Calx.go '(- (+ 1 2 3))'
  end
end
