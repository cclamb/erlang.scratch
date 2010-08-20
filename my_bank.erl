-module(my_bank).
-behaviour(gen_server).
-export([start/0]).
-export([init/1. handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).
-compile(export_all).

start() -> gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).
stop() -> gen_server:call(?MODULE, stop).

new_account(Who) -> gen_server:call(?MODULE, {new, Who}).
deposit(Who, Amount) -> gen_server:call(?MODULE, {add, Who, Amount}).
withdraw(Who, Amount) -> gen_server:call(?MODULE, {remove, Who, Amount}).

init([]) -> {ok, ets:new(?MODULE, [])}.

handle_call({new, Who}, _From, Tab) ->
	Reply = case ets:lookup(Tab, Who) of
		[] 	-> ets:insert(Tab, {Who, 0}),
			{welcome, Who};
		[_]	-> {}
	end,
	{reply, Reply, Tab};