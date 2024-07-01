/*animal(Nombre,Clase, Medio)*/
animal(ballena,mamifero,acuatico).
animal(tiburon,pez,acuatico).
animal(lemur,mamifero,terrestre).
animal(golondrina,ave,aereo).
animal(tarantula,insecto,terrestre).
animal(lechuza,ave,aereo).
animal(orangutan,mamifero,terrestre).
animal(tucan,ave,aereo).
animal(puma,mamifero,terrestre).
animal(abeja,insecto,aereo).
animal(leon,mamifero,terrestre).
animal(lagartija,reptil,terrestre).

/* tiene(Quien, Que, Cuantos)*/
tiene(nico, ballena, 1).
tiene(nico, lemur, 2).
tiene(maiu, lemur, 1).
tiene(maiu, tarantula, 1).
tiene(juanDS, golondrina, 1).
tiene(juanDS, lechuza, 1).
tiene(juanR, tiburon, 2).
tiene(nico, golondrina, 1).
tiene(juanDS, puma, 1).
tiene(maiu, tucan, 1).
tiene(juanR, orangutan,1).
tiene(maiu,leon,2).
tiene(juanDS,lagartija,1).
tiene(feche,tiburon,1).

nadieLoTiene(Animal):-
    animal(Animal, _, _),
    not(tiene(_, Animal, _)).


animalDificil(Animal):- 
    nadieLoTiene(Animal).
% Solo 1 persona tiene 1 de ese animal
animalDificil(Animal):-
    tiene(Persona, Animal, 1),
    not(
        (tiene(OtraPersona, Animal, _),
         Persona \= OtraPersona)
    ).

leGusta(nico, Animal):-
    animal(Animal, _, terrestre),
    Animal \= lemur.
leGusta(maiu, Animal):-
    animal(Animal, Clase, _),
    Clase \= insecto.
leGusta(maiu, abeja).
leGusta(juan, Animal):-
    animal(Animal, _, acuatico).
leGusta(juan, Animal):-
    animal(Animal, ave, _).
leGusta(juanR, Animal):-
    tiene(juanR, Animal, _).
leGusta(feche, lechuza).
% animalDificil/1: si nadie lo tiene, o bien si una sola persona tiene uno solo.

% leGusta/2

% estaFeliz(Persona):-
%     tiene(Persona, _, _),
%     not(
%         (
%             tiene(Persona, Animal, _),
%             not(leGusta(Persona, Animal))
%         )
%     ).
estaFeliz(Persona):-
    tiene(Persona, _, _),
    forall(tiene(Persona, Animal, _),
            leGusta(Persona, Animal)).


% estaFeliz/1: si le gustan todos los animales que tiene.

% tieneTodosDe/2: si la persona tiene todos los animales de ese medio o clase.

% completoLaColeccion/1: si la persona tiene todos los animales.

% delQueMasTiene/2: si la persona tiene más de este animal que del resto.

:- begin_tests(palitos_de_la_selva).

test("Un animal es dificil si nadie lo tiene", nondet):-
    animalDificil(abeja).
test("Un animal NO es dificil si lo tienen al menos 2 personas"):-
    not(animalDificil(tiburon)).
test("Un animal es dificil si solo 1 persona tiene solo 1"):-
    animalDificil(ballena).
test("Un animal NO es dificil si solo 1 persona lo tiene pero tiene varios de ese"):-
    not(animalDificil(leon)).

test("A nico le gustan los animales terrestres que no sean lemur"):-
    leGusta(nico, tarantula).
test("A nico no le gustan los animales que no son terrestres"):-
    not(leGusta(nico, golondrina)).
test("A nico no le gusta el lemur"):-
    not(leGusta(nico, lemur)).

test("A maiu le gustan los animales que no son insectos", nondet):-
    leGusta(maiu, lemur).
test("A maiu no le gustan los insectos, excepto por la abeja"):-
    not(leGusta(maiu, tarantula)).
test("A maiu le gusta la abeja"):-
    leGusta(maiu, abeja).

test("A juan le gustan los animales acuaticos", nondet):-
    leGusta(juan, ballena).
test("A juan le gustan las aves"):-
    leGusta(juan, golondrina).
test("A juan no le gustan los animales que no son ni aves ni acuaticos"):-
    not(leGusta(juan, lemur)).

test("A juanR le gustan los animales que tiene", nondet):-
    leGusta(juanR, tiburon).
test("a juanR no le gustan los animales que no tiene"):-
    not(leGusta(juanR, puma)).

test("A feche le gustan las lechuzas"):-
    leGusta(feche, lechuza).
test("A feche no le gustan los animales que no sean lechuzas"):-
    not(leGusta(feche, puma)).

:- end_tests(palitos_de_la_selva).