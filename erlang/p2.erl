#!/usr/bin/env escript

%% 递归版本
%% fib(1) -> 1;
%% fib(2) -> 1;
%% fib(N) -> fib(N-1) + fib(N-2).

%% 尾递归优化版本
fib2(N) -> fib2_iter(1,0,N).
fib2_iter(A, B, N) ->
  if
    N == 0 -> B;
    true -> fib2_iter(A+B, A, N-1)
  end.

main(_) ->
  io:format("~p~n",
    [lists:foldl(fun(X, Sum) -> X + Sum end, 0,
        lists:filter(fun(X) -> (X rem 2) =:= 0 end,
          lists:filter(fun(X) -> X < 4000000 end,
            [fib2(X) || X <- lists:seq(1,40)])))]).
