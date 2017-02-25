-module(exerice_1_15).
-export([xOr/2,xOr2/2,xOr3/2,xOr4/2,maxThree/3,howManyEqual/3]).

xOr(flase,true) ->
  true;
xOr(true,flase) ->
  true;
xOr(true,true) ->
  flase;
xOr(_,_) ->
  flase.

xOr2(X,Y) ->
  X=/=Y.

xOr3(X,Y) ->
  X== not Y.

xOr4(X,Y) ->
  X== not Y.

maxThree(A,B,C) ->
  lists:max([A,B,C]).

howManyEqual(N,N,N) ->
  3;
howManyEqual(N,_,N) ->
  2;
howManyEqual(_,N,N) ->
  2;
howManyEqual(N,N,_) ->
  2;
howManyEqual(_,_,_) ->
  0.
