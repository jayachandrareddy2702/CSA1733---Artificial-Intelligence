% Facts
% parent(Parent, Child).
parent(john, mary).
parent(john, mike).
parent(susan, mary).
parent(susan, mike).
parent(mary, kate).
parent(mary, tom).
parent(paul, kate).
parent(paul, tom).

% male(Person).
male(john).
male(mike).
male(tom).
male(paul).

% female(Person).
female(susan).
female(mary).
female(kate).

% Rules
% child(Child, Parent).
child(Child, Parent) :-
    parent(Parent, Child).

% father(Father, Child).
father(Father, Child) :-
    parent(Father, Child),
    male(Father).

% mother(Mother, Child).
mother(Mother, Child) :-
    parent(Mother, Child),
    female(Mother).

% sibling(Person1, Person2).
sibling(Person1, Person2) :-
    parent(Parent, Person1),
    parent(Parent, Person2),
    Person1 \= Person2.

% brother(Brother, Sibling).
brother(Brother, Sibling) :-
    sibling(Brother, Sibling),
    male(Brother).


