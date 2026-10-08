% Facts: Male
male(abraham).
male(herb).
male(homer).
male(clancy).
male(bart).
% Facts: Female
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).
% Facts: Parent relationships
parent(abraham, herb).
parent(abraham, homer).
parent(mona, herb).
parent(mona, homer).
parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).
parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).
% Rules
father(X,Y) :- male(X), parent(X,Y).
mother(X,Y) :- female(X), parent(X,Y).
son(X,Y) :- male(X), parent(Y,X).
daughter(X,Y) :- female(X), parent(Y,X).

brother(X,Y) :-
    male(X),
    parent(P,X),
    parent(P,Y),
    X \= Y.

sister(X,Y) :-
    female(X),
    parent(P,X),
    parent(P,Y),
    X \= Y.

grandfather(X,Y) :-
    male(X),
    parent(X,Z),
    parent(Z,Y).

aunt(X,Y) :-
    female(X),
    parent(P,Y),
    sister(X,P).

uncle(X,Y) :-
    male(X),
    parent(P,Y),
    brother(X,P).

cousin(X,Y) :-
    parent(P1,X),
    parent(P2,Y),
    (brother(P1,P2) ; sister(P1,P2)),
    X \= Y.

ancestor(X,Y) :-
    parent(X,Y).

ancestor(X,Y) :-
    parent(X,Z),
    ancestor(Z,Y).
