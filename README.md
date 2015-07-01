# Calx

Calx is a simple calculator which uses the "lisp-syntax" for
input. It's implemented with "real" lexer and parser generators for
the purpose of a nice demo at the Berlin Erlang User Group.

## Usage

If you have Elixir installed, compile the project with `mix
compile`. If you don't have Elixir, follow the
[installation instructions](http://elixir-lang.org/install.html)

Let's try the calculator!
```
$ iex -S mix
iex(1)> Calx.go '(+ 1 1)'
2
iex(2)> Calx.go '(- (+ 42))'
-42
iex(3)> Calx.go (+ 1 2 3 4 5 6 7 8 9)'
45
```

Run the tests:
```
mix test
```

## `leex` and `yecc` with Elixir

The `mix` build tool has built-in support for compiling `.xrl` and
`.yrl` files. Just put the files in the `src/` folder and `mix` will
do the right thing by default. It will generate Erlang modules, which
you can call from Elixir like so: `:calx_lexer.string('(+ 1 2)')`.
