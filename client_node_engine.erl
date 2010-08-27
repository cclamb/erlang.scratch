-module(client_node_engine).
-export([start/0]).

start() ->
	client_node_supervisor:start_link([]),
	gen_event:add_handler(event_manager, remote_handler, []),
	gen_event:add_handler(event_manager, local_handler, []).