-module(recursion_examples).
-export([fib/1,pieces/1,pieces_dimensional/2]).

fib(0) ->
  0;
fib(1) ->
  1;
fib(N) ->
  fib(N-1) + fib(N-2).

pieces(0) -> 0;
pieces(N) ->
  N + pieces(N-1).

pieces_dimensional(0,_) ->
  1;
pieces_dimensional(N,1) ->
  N+1;
pieces_dimensional(N,D) ->
  pieces_dimensional(N-1,D) + pieces_dimensional(N-1,D-1).
