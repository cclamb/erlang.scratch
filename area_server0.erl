-module(area_server0).
-compile(export_all).

loop() ->
		receive
			{rectangle, Width, Ht} ->
				io:format("Rectangle: ~p~n", [Width * Ht]),
				loop();
			{circle, R} ->
				io:format("Circle: ~p~n", [3.1415 * R * R]),
				loop();
			Other ->
				io:format("Que? ~p~n", [Other]),
				loop()
		end.