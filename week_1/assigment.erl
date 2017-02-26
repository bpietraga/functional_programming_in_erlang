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
    % Format integer to binary number in string format.
    % Result is in list with string inside,
    % so I decided to use patter matching to get string out of list.
    [BinaryString] = io_lib:format("~.2B",[N]),
    % runs function which returns number of bits
    % (exactly character 1) in string.
    count_bits(BinaryString).

count_bits(String) ->
    % Define anonymous function which adds to accumulator if
    % character is bit.
    % If there is nothing more it returns accumulator value.
    P = fun(Chr,ACC) when Chr=:=$1 -> ACC+1;
           (_,ACC)                 -> ACC
        end,
    % Now foldl iterates on string and adds to accumulator each bit ocurrance.
    % foldl is tail recursive.
    % If I've wanted to make it direct recursive I would have used foldr
    % which is direct recursive.
    lists:foldl(P, 0, String).
