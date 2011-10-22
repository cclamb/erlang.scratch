-module(area_server1).
-compile(export_all).

rpc(Pid, Request) ->
	Pid ! {self(), Request},
	receive
		Response -> Response
	end.
	
loop() ->
	receive
		{From, {rectangle, Width, Ht}} ->
			From ! Width * Ht,
			loop();
		{From, {circle, R}} ->
			From ! 3.1415 * R * R,
			loop();
		{From, Other} ->
			From ! {error, Other},
			loop()
	end.