-module(assigment).
-export([perimeter/1,bits/1]).

perimeter({circle, R}) ->
    2*math:pi()*R;
perimeter({triangle, {A,B,C}}) ->
    A+B+C;
perimeter({equilateral_triangle, {A}}) ->
    3*A;
perimeter({square, {A}}) ->
    A*4;
perimeter({rectangle, {A,B}}) ->
    2*(A+B);
perimeter({equilateral_polygon, {N, A}}) ->
    N*A;
perimeter({regular_polygon, {N, B}}) ->
    2 * N * B * math:sin(math:pi()/N);
perimeter({polygon, ListOf}) ->
    ListOf.

bits(N) when N >= 0 ->
    [String]= io_lib:format("~.2B", [N]),
    count_bits(String).

count_bits(String) ->
    F = fun(X, N) when X =:= $1 -> N + 1;
           (_, N)               -> N
        end,
    lists:foldl(F, 0, String).
