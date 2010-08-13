-module(event_service).
-export([loop/0]).

-define(PI, 3.14159).

loop() ->
	receive
		{circle, R}	->
			io:format("Circle radius is ~p~n", [?PI * R * R]),
			loop();
		Other 		->
			io:format("Unknown message ~p~n", [Other]),
			loop()
	end.