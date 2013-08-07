%% Copyright
-module(costcalc).
-author("Phillip").

%% API
-export([start/0]).

start() ->
  io:fwrite("Calculate the cost of flooring based on width, height, and cost per square foot.\n"),
  {W,_} = string:to_integer(io:get_line("Width in feet: ")),
  {H,_} = string:to_integer(io:get_line("Height in feet: ")),
  {C,_} = string:to_integer(io:get_line("Cost in dollars per square foot: $")),
  _Cost = (W * H) * C.