wet_grass:- raining.
working_hard :- studying(john), studying(mary).
raining.
studying(john).
studying(mary).
conclude(X) :- wet_grass, X='The grass is wet.'.
conclude(X) :- working_hard, X='John & Mary are working hard.'.