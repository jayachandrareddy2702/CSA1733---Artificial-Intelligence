
% Facts
parent(a, b).
parent(b, c).

% Rule
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

% Query
% To check if 'a' is an ancestor of 'c', you can query:
% ?- ancestor(a, c).
