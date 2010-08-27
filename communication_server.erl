-module(communication_server).
-behaviour(gen_server).
-export([start/0, stop/0, register/1, call/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

start() -> gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).
stop() 	-> gen_server:call(?MODULE, stop).

register(CncHost)	-> gen_server:call(?MODULE, {register, CncHost}).
call(Packet)		-> gen_server:call(?MODULE, {call, Packet}).

init([]) ->
	io:format("*** init on CNC *** ~p~n", [?MODULE]),
	{ok, 0}.

handle_call({register, CncHost}, _From, N) ->
	io:format("*** registering with CNC *** ~p~n", [?MODULE]),
	Reply = CncHost,
	{reply, Reply, N + 1};
handle_call({call, Packet}, _From, N) ->
	io:format("*** call from CNC *** ~p~n", [?MODULE]),
	Reply = Packet,
	{reply, Reply, N + 1};
handle_call(stop, _From, N) ->
	io:format("*** stopping *** ~p~n", [?MODULE]),
	{stop, normal, stopped, N + 1}.

handle_cast(_Msg, State) -> {noreply, State}.
handle_info(_Info, State) -> {noreply, State}.
terminate(_Reason, _State) -> ok.
code_change(_OldVsn, State, Extra) -> {ok, State, Extra}.