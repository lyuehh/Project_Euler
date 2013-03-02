#!/usr/bin/env escript

main(_) ->
  io:format("~p~n",
    [lists:foldl(fun(X, Sum) -> X + Sum end, 0,
        [X || X <- lists:seq(1,999),
          (X rem 3 == 0) or  ( X rem 5 == 0)])]).
