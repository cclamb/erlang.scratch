-module(area_server_final).
-compile(export_all).

start() -> spawn(fun loop/0).
	
area(Pid, What) -> rpc(Pid, What).

rpc(Pid, Request) ->
	Pid ! {self(), Request},
	receive
		{Pid, Response} -> Response
	end.
	
loop() ->
	receive
		{From, {rectangle, Width, Ht}} ->
			From ! {self(), Width * Ht},
			loop();
		{From, {circle, R}} ->
			From ! {self(), 3.1415 * R * R},
			loop();
		{From, Other} ->
			From ! {self(), {error, Other}},
			loop()
	end.