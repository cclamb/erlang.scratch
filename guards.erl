-module(guards).
-export([talk/1, talk/2]).

talk(dog) 	-> woof;
talk(cat) 	-> meow;
talk(_) 	-> noise.

talk(dog, cat) 	-> woow;
talk(cat, dog) 	-> meof;
talk(_, _) 		-> que.
