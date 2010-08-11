-module(area).
-export([area/1]).

-define(PI, 3.14159).

area({rect, H, L})	-> H * L;
area({circle, R}) 	-> ?PI * R * R;
area({square, S})	-> S * S.