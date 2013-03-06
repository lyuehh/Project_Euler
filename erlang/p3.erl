#!/usr/bin/env escript

% https://github.com/neall/neal-euler/blob/master/003.erl
% Start by checking the lowest prime: 2
maxfactor(Target) -> maxfactor(2, Target).

% when the factor we are trying is > the square root of
% Target, Target is the largest prime factor
maxfactor(Try, Target) when Try * Try > Target -> Target;

% When we find a factor, factor it out and try it again
maxfactor(Try, Target) when Target rem Try == 0 ->
  maxfactor(Try, Target div Try);

% After we factor out any 2s, start us off on odd numbers
maxfactor(2, Target) -> maxfactor(3, Target);

% Try the next odd number (easier than figuring out primes)
maxfactor(Try, Target) -> maxfactor(Try + 2, Target).


main(_) ->
  io:format("~p~n", [maxfactor(600851475143)]).

