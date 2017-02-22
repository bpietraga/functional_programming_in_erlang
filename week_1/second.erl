-module(second).
-export([hypotenuse/2,perimerter/2]).
-import('first',[square/1]).

hypotenuse(A,B) ->
  math:sqrt(square(A)+square(B)).

perimerter(A,B) ->
  A+B+hypotenuse(A,B).
