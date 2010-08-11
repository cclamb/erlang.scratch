%% Module and entry point definition.
-module(primes).
-export([primes/1]).

%% Feed into the working functions passing along the prime/not prime lists.
primes(L) -> primes(L, [], []).

%% Basis case; when the list of items to evaluate is empty return the
%% prime/not prime lists.
primes([], Primes, Not_Primes) -> {Primes, Not_Primes};

%% Induction case; pull the head off the list and evalute.  This is a specific
%% type of function known as an accumulator.
primes([H|T], Primes, Not_Primes) -> 
	case(is_prime(2, H)) of
		true -> primes(T, [H|Primes], Not_Primes);
		false -> primes(T, Primes, [H|Not_Primes])
	end.

%% Test predicates for primeness.  The first clause will return zero if
%% the number is prime.  The second will increment the number we're dividing
%% by and recurse, and the final case returns true if the number is not divided
%% by any of the submitted numbers.
is_prime(I, H) when H rem I =:= 0 -> false;
is_prime(I, H) when I < H - 1 -> is_prime(I + 1, H);
is_prime(_, _) -> true.