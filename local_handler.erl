-module(local_handler).
-behaviour(gen_event).
-export([init/1, handle_event/2, terminate/2, code_change/3, handle_call/2, handle_info/2]).
-export([add_handler/2]).

init(_Args) ->
    {ok, []}.

add_handler(EventMan, Args) ->
	io:format("*** registering local handler *** ~p~n", [?MODULE]),
	gen_event:add_handler(EventMan, ?MODULE, Args).

handle_event(ErrorMsg, State) ->
    io:format("*** handling locally *** ~p~n", [ErrorMsg]),
    {ok, State}.

terminate(_Args, _State) ->
    ok.

handle_call(_Msg, State) -> {noreply, State}.
handle_info(_Info, State) -> {noreply, State}.
code_change(_OldVsn, State, Extra) -> {ok, State, Extra}.