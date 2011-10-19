-module(exceptions).
-export([demo/0, demo_catch/0, demo_stack/0]).

generate_exception(1) -> ok;
generate_exception(2) -> throw(err);
generate_exception(3) -> exit(err);
generate_exception(4) -> {'EXIT', ok};
generate_exception(5) -> erlang:error(err).

demo() -> [catcher(I) || I <- [1,2,3,4,5]].

demo_catch() -> [{I, (catch generate_exception(I))} || I <- [1,2,3,4,5]].
	
demo_stack() ->
	try generate_exception(5)
	catch
		error:X -> {X, erlang:get_stacktrace()}
	end. 

catcher(N) ->
	try generate_exception(N) of
		Val -> {N, normal, Val}
	catch
		throw:X -> {N, caught, thrown, X};
		exit:X -> {N, caught, exited, X};
		error:X -> {N, caught, error, X}
	end.
