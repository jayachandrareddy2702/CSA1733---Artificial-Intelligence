bird(canary).
bird(sparrow).
bird(ostrich).
can_fly(canary).
can_fly(sparrow).
can_bird_fly(Bird) :-
    bird(Bird),can_fly(Bird).