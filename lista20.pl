% --- family
parent(kim,holly).
parent(margaret,kim).
parent(margaret,kent).
parent(esther,margaret).
parent(herbert,margaret).
parent(herbert,jean).
parent(jean, joe).

female(kim).
female(margaret).
female(esther).
female(holly).
female(jean).

male(kent).
male(herbert).
male(joe).

mother(X,Y) :- female(X), parent(X,Y).

father(X,Y) :- male(X),parent(X,Y).

sister(X,Y) :- parent(Z, X), parent(Z, Y), female(X), not(X=Y).

grandson(X,Y) :- parent(Y, Z), parent(Z, X), male(X).

greatgrandparent(GGP,GGC) :- parent(GGP,GP), parent(GP,P), parent(P,GGC).

siblings(X,Y) :- parent(Z, X), parent(Z, Y), not(X=Y).

firstCousin(X,Y) :- parent(Z,X), parent(K,Y), siblings(Z,K).

descendant(X,Y) :- parent(Y,X).

descendant(X,Y) :- parent(Y,Z), descendant(X, Z).

% ----- end family

% --- playing with lists

third([_,_,Y|_], Y).

firstPair([X,X|_], X).

select(X, [X|L], L).
select(X, [H|L], [H|LR]):- select(X, L, LR).

del3([A,B,_|L], [A,B|L]).

dupList([],[]).
dupList([X|L], [X,X|L2]) :- dupList(L,L2).

isDuped([]).
isDuped([X,X|L]):- isDuped(L).

oddSize([X]).
oddSize([X,Y|L]):- oddSize(L).

evenSize([]).
evenSize([X,Y|L]):-evenSize(L).

prefix([],[]).
prefix([],L).
prefix([H|L],[H|L2]):- prefix(L,L2).

isMember(X, [X|_]).
isMember(X, [_|Y]) :- isMember(X, Y).

isUnion([],[],[]).
isUnion([H|L], L2, [H|L3]):- isUnion(L, L2, L3).
isUnion(L, [H2|L2], [H2|L3]):- isUnion(L ,L2, L3).

isEqual([], []).
isEqual(T, L) :- isMember(H, T), select(H, T, L1), isEqual(L1, L2), L = [H|L2].

isDifference(X,[],Z):- isEqual(X,Z).
isDifference(X,[H|T],[]).
isDifference(X,Y,[H|T]):- isMember(H, X), not(isMember(H,Y)), isDifference(X,Y,T).


















