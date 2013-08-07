%% Copyright
-module(costcalc).
-author("Phillip").

%% API
-export([start/0]).

%%docalc() ->
%%  io:fwrite("Please terminate each expression with a period ('.').\n"),
%%  ReadWidth = io:get_line("Width: "),
%%  ReadHeight = io:get_line("Height: "),
%%  ReadCost = io:get_line("Cost: $"),
%%  {_,Width} = ReadWidth,
%%  {_,Height} = ReadHeight,
%%  {_,Cost} = ReadCost,
%%  io:fwrite(Width + " * " + Height + " * " + Cost + " = " + Width * Height * Cost).

start() ->
  io:fwrite("Calculate the cost of flooring based on width, height, and cost per square foot.\n"),
  {W,_} = string:to_integer(io:get_line("Width in feet: ")),
  {H,_} = string:to_integer(io:get_line("Height in feet: ")),
  {C,_} = string:to_integer(io:get_line("Cost in dollars per square foot: $")),
  _Cost = (W * H) * C.