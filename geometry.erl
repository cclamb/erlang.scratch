-module(geometry).
-export([area/1]).
area({rectangle, W, H}) -> W * H;
area({circle, R}) -> 3.14159 * R * R.
