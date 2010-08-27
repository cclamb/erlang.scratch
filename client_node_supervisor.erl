-module(client_node_supervisor).
-behaviour(supervisor).
-export([start_link/1, init/1]).
		
start_link(Args) ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, Args).
	
init([]) ->
	io:format("*** init(.) on supervisor *** ~p~n", [?MODULE]),
	{ok, {{one_for_one, 3, 10},
		[
		 {event_manager,
		 	{gen_event, start_link, [{local, event_manager}]},
		    	permanent, 
				10000, 
				worker, 
				dynamic},
		 {communication_server,
			{communication_server, start, []},
				 permanent, 
				 10000, 
				 worker, 
				 [communication_server]}
		]}}.