%% Copyright
-module(machin).
-author("Phillip").

%% API
-export([pi/1]).

arccot(X, Unity) ->
  Start = Unity div X,
  arccot(X, Unity, 0, Start, 1, 1).

arccot(_X, _Unity, Sum, XPower, N, _Sign) when XPower div N =:= 0 ->
  Sum;
arccot(X, Unity, Sum, XPower, N, Sign) ->
  Term = XPower div N,
  arccot(X, Unity, Sum + Sign*Term, XPower div (X*X), N+2, -Sign).

pi(Digits) ->
  Unity = pow(10, Digits+10),
  Pi = 4 * (4 * arccot(5, Unity) - arccot(239, Unity)),
  Pi div pow(10,10).

pow(Base, Exponent) when Exponent < 0 ->
  pow(1 / Base, -Exponent);

pow(Base, Exponent) when is_integer(Exponent) ->
  pow(Exponent, 1, Base).

pow(0, Product, _Modifier) ->
  Product;

pow(Exponent, Product, Modifier) when Exponent rem 2 =:= 1 ->
  pow(Exponent div 2, Product * Modifier, Modifier * Modifier);

pow(Exponent, Product, Modifier) ->
  pow(Exponent div 2, Product, Modifier * Modifier).