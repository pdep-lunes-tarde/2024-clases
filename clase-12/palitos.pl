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
leGusta(juanDS, Animal):-
    animal(Animal, _, acuatico).
leGusta(juanDS, Animal):-
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

% tieneTodosDe/2: dado un medio o clase, si todos los animales que tiene la persona son de ese medio o clase.

esDeClasificacion(Animal, Medio):-
    animal(Animal, _, Medio).
esDeClasificacion(Animal, Clase):-
    animal(Animal, Clase, _).

tieneTodosDe(Persona, Clasificacion):-
    esDeClasificacion(_, Clasificacion),
    tiene(Persona, _, _),
    forall(
        tiene(Persona, Animal, _),
        esDeClasificacion(Animal, Clasificacion)
    ).

completoLaColeccion(Persona):-
    tiene(Persona, _, _),
    forall(animal(Animal, _, _),
            tiene(Persona, Animal, _)).

delQueMasTiene(Persona, Animal):-
    tiene(Persona, Animal, Cantidad),
    forall(
        (tiene(Persona, OtroAnimal, CantidadDeOtro),
        Animal \= OtroAnimal),
        Cantidad > CantidadDeOtro
    ).

% delQueMasTiene(Persona, Animal):-
%     tiene(Persona, Animal, Cantidad),
%     not(
%         (tiene(Persona, OtroAnimal, CantidadDeOtro),
%         Animal \= OtroAnimal,
%         Cantidad =< CantidadDeOtro)
%     ).
    

% completoLaColeccion/1: si la persona tiene todos los animales.

% delQueMasTiene/2: si la persona tiene más de este animal que del resto.

tieneParaIntercambiar(Persona, Animal):-
    tiene(Persona, Animal, _),
    not(leGusta(Persona, Animal)).

tieneParaIntercambiar(Persona, Animal):-
    tiene(Persona, Animal, Cantidad),
    Cantidad > 1.

tieneParaIntercambiar(juanR, Animal):-
    tiene(juanDS, Animal, _).

tieneParaOfrecerle(QuienOfrece, QuienRecibe):-
    tieneParaIntercambiar(QuienOfrece, Animal),
    leGusta(QuienRecibe, Animal),
    not(tiene(QuienRecibe, Animal, _)).

puedenNegociar(UnaPersona, OtraPersona):-
    tieneParaOfrecerle(UnaPersona, OtraPersona),
    tieneParaOfrecerle(OtraPersona, UnaPersona).

manejaElMercado(Persona):-
    tiene(Persona, _, _),
    forall(
        (tiene(OtraPersona, _, _),
        Persona \= OtraPersona),
        tieneParaOfrecerle(Persona, OtraPersona)
    ).

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
    leGusta(juanDS, ballena).
test("A juan le gustan las aves"):-
    leGusta(juanDS, golondrina).
test("A juan no le gustan los animales que no son ni aves ni acuaticos"):-
    not(leGusta(juanDS, lemur)).

test("A juanR le gustan los animales que tiene", nondet):-
    leGusta(juanR, tiburon).
test("a juanR no le gustan los animales que no tiene"):-
    not(leGusta(juanR, puma)).

test("A feche le gustan las lechuzas"):-
    leGusta(feche, lechuza).
test("A feche no le gustan los animales que no sean lechuzas"):-
    not(leGusta(feche, puma)).

test("Una persona esta feliz si todos los animales que tiene le gustan", nondet):-
    estaFeliz(juanR).
test("Una persona no esta feliz si algun animal que tiene no le gusta"):-
    not(estaFeliz(nico)).

test("Una persona tieneTodosDe un medio si todos los animales que tiene son de ese medio", nondet):-
    tieneTodosDe(feche, acuatico).
test("Una persona tieneTodosDe una clase si todos los animales que tiene son de esa clase", nondet):-
    tieneTodosDe(feche, pez).
test("Una persona NO tieneTodosDe un medio si algun animal que tiene no es de ese medio"):-
    not(tieneTodosDe(feche, aereo)).
test("Una persona NO tieneTodosDe una clase si algun animal que tiene no es de esa clase"):-
    not(tieneTodosDe(nico, insecto)).

test("Una persona NO completo la coleccion si tiene todos los animales"):-
    not(completoLaColeccion(nico)).

test("Un animal es del que mas tiene una persona si tiene mas de ese que del resto"):-
    delQueMasTiene(maiu, leon).
test("Un animal NO es del que mas tiene una persona si tiene mas de algun otro animal que de ese"):-
    not(delQueMasTiene(maiu, lemur)).

test("Una persona tiene para intercambiar un animal si lo tiene y no le gusta", nondet):-
    tieneParaIntercambiar(feche, tiburon).
test("Una persona no tiene para intercambair un animal si no lo tiene"):-
    not(tieneParaIntercambiar(feche, abeja)).
test("Una persona no tiene para intercambiar un animal que le gusta a menos que tenga mas de 1"):-
    not(tieneParaIntercambiar(juanR, orangutan)).
test("Una persona tiene para intercambiar un animal si le gusta pero lo tiene varias veces", nondet):-
    tieneParaIntercambiar(juanR, tiburon).
test("JuanR tiene para intercambiar los que juan tiene", nondet):-
    tieneParaIntercambiar(juanR, golondrina).

test("Una persona tiene para ofrecerle a otro si tiene un animal para intercambiar, la segunda no lo tiene y a la segunda le gusta", nondet):-
    tieneParaOfrecerle(maiu, nico).

test("Una persona no tiene para ofrecerle a otro si no tiene ningun animal que a la otra persona le falte"):-
    not(tieneParaOfrecerle(feche, juanR)).

test("Una persona no tiene para ofrecerle a otro si no tiene ningun animal que a la otra persona le guste"):-
    not(tieneParaOfrecerle(feche, nico)).

test("Pueden negociar si tienen para ofrecerse mutuamente", nondet):-
    puedenNegociar(maiu, nico).
test("No pueden negociar si alguna no tiene para ofrecerle a la otra"):-
    not(puedenNegociar(maiu, feche)).

test("Maneja el mercado si tiene para ofrecerle a todos", nondet):-
    manejaElMercado(juanR).
test("No maneja el mercado si hay alguien a quien no tiene para ofrecerle"):-
    not(manejaElMercado(feche)).

:- end_tests(palitos_de_la_selva).