-module(tri).
-export([test/0, except/0]).

test() ->
	try except() of
		{foo, bar} ->
			io:format("first: ~p~n", [{foo, bar}]);
		Other ->
			io:format("second: ~p~n", [Other])
	catch
		_:Why ->
			io:format("catch ~p~n", [Why])
	end.
			
	
except() -> 
	throw(freako),
	{foo}.