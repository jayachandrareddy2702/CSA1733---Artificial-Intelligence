% Monkey and Banana Problem in Prolog

% Initial state: monkey at door, monkey on floor, monkey not having bananas, and bananas at middle.
initial_state(state(at_door, on_floor, has_not, at_middle)).

% Goal state: monkey having bananas.
goal_state(state(_, _, has, _)).

% State transitions
move(state(at_door, on_floor, H, B), grasp, state(at_door, on_box, has, B)).
move(state(P, on_floor, H, B), climb, state(P, on_box, H, B)).
move(state(P1, on_floor, H, B), walk(P1, P2), state(P2, on_floor, H, B)).
move(state(P, on_box, H, at_P), push_box(P, P2), state(P2, on_box, H, at_P)).

% Valid movements
move(state(at_door, on_box, H, B), climb_down, state(at_door, on_floor, H, B)).
move(state(at_middle, on_box, H, B), climb_down, state(at_middle, on_floor, H, B)).

% Solving the problem
solve(State, []) :- goal_state(State).
solve(State1, [Move|Moves]) :-
    move(State1, Move, State2),
    solve(State2, Moves).

% Query
?- initial_state(State), solve(State, Moves).
