-module(exercise_1_21).
-export([fib/1,perfect/1]).

fib(N) when N >= 0 ->
  fib(0,1,N).
fib(ACC, _ACC2, 0) ->
  ACC;
fib(ACC, ACC2, N) ->
  fib(ACC2, ACC+ACC2, N-1).

perfect(1) ->
  true;
perfect(N) when N > 1 ->
  perfect(N,N div 2, 0).

perfect(N,0,N) ->
  true;
perfect(N,D,ACC) when N rem D == 0 ->
  perfect(N,D-1,ACC+D);
perfect(N,D,ACC) ->
  perfect(N,D-1,ACC).

