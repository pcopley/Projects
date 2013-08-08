%% Source: http://en.literateprograms.org/Fibonacci_numbers_(Erlang)
%% Hoping to deconstruct the recursion here later this week, particularly the login behind fibo3/3

%% Copyright
-module(fibonacci).
-author("Phillip").

%% API
-export([fibo/1, fibo2/1, fibo3/1, print_nfibos/2]).

%% fibonacci:print_nfibos(N, fun fibonacci:fibo/1).

print_nfibos(N, FiboFunc) -> printfibos(N, FiboFunc, 0).

printfibos(0, FiboFunc, N) ->
  Res = FiboFunc(N),
  io:fwrite("~w ~w~n", [N, Res]);
  printfibos(Iter, FiboFunc, N) when Iter > 0 ->
    Res = FiboFunc(N),
    io:fwrite("~w ~w~n", [N, Res]),
    printfibos(Iter-1, FiboFunc, N+1).

fibo(0) -> 0;
  fibo(1) -> 1;
  fibo(N) when N > 1 -> fibo(N-1) + fibo(N-2).

fibo2_tr(0, Result, _Next) -> Result;
  fibo2_tr(Iter, Result, Next) when Iter > 0 -> fibo2_tr(Iter-1, Next, Result+Next).

fibo2(N) -> fibo2_tr(N, 0, 1).

fibo3(N) ->
  {Fib, _} = fibo3(N, {1, 1}, {0, 1}),
  Fib.

fibo3(0, _, Pair) -> Pair;
fibo3(N, {Fib1, Fib2}, Pair) when N rem 2 == 0 ->
  SquareFib1 = Fib1 * Fib1,
  fibo3(N div 2, {2*Fib1*Fib2 - SquareFib1, SquareFib1 + Fib2*Fib2}, Pair);
fibo3(N, {FibA1, FibA2} = Pair, {FibB1, FibB2}) ->
  fibo3(N-1, Pair, {FibA1*FibB2 + FibB1*(FibA2-FibA1), FibA1*FibB1 + FibA2*FibB2}).
