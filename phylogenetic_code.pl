
species_name('African wild dog','Lycaon pictus').
species_name('Common fox','Vulpes vulpes').
species_name('Arctic fox','Vulpes lagopus').
species_name('Fennec fox','Vulpes zerda').
species_name('Red wolf','Canis rufus').
species_name('coyote','Canis latrans').
species_name('Gray wolf','Canis lupus').
species_name('Dog','Canis lupus familiaris').

species_genus('Lycaon pictus','Lycaon').
species_genus('Vulpes vulpes','Vulpes').
species_genus('Vulpes lagopus','Vulpes').
species_genus('Vulpes zerda','Vulpes').
species_genus('Canis rufus','Canis').
species_genus('Canis latrans','Canis').
species_genus('Canis lupus','Canis').
species_genus('Canis lupus familiaris','Canis').

genus_family('Lycaon','Canidae').
genus_family('Vulpes','Canidae').
genus_family('Canis','Canidae').

common_species(X,Y) :-
	species_name(X,Z),
	species_name(Y,Z).

common_species('Dog','Gray wolf').
common_species('Gray wolf','Dog').

common_genus(X,Y) :-
	species_name(X,Z),
	species_genus(Z,G),
	species_name(Y,W),
	species_genus(W,G).

print([Head|Tail]) :-
	write(Head),
	write(' <--> '),
	print(Tail).

relation_path(A,B,X) :-
	species_name(A,S1),
	species_genus(S1,G1),
	genus_family(G1,F),
	species_name(B,S2),
	species_genus(S2,G2),

	X = [ A , S1 , G2 , S2 , B ],
	P = [ A , S1 , G1 , F , G2 , S2 , B ],

	( G2 = G1 -> print(X) ; print(P) ).

