%% Module and entry point definition.
-module(filter).
-export([filter/1]).

%filter(L, K) -> [X || {K, X} <- L].
filter(L) -> [X || {a,X} <- L].