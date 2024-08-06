laberinto([
    [//, //, //, <>],
    [//, .., .., ..],
    [//, .., //, ..],
    [.., .., //, ..],
    [//, //, //, //]
]).

resolver(Laberinto, PosicionInicial, Camino):-
    resolucion(Laberinto, PosicionInicial, [], Camino).

resolucion(Laberinto, PosicionInicial, PosicionesRecorridas, []):-
    celda(Laberinto, PosicionInicial, <>).

resolucion(Laberinto, PosicionInicial, PosicionesRecorridas, [Direccion | CaminoSiguiente]):-
    celda(Laberinto, PosicionInicial, ..),
    siguientePosicion(PosicionInicial, Direccion, NuevaPosicion),
    posicionEsValida(Laberinto, NuevaPosicion),
    not(member(NuevaPosicion, PosicionesRecorridas)),
    resolucion(Laberinto, NuevaPosicion, [PosicionInicial | PosicionesRecorridas], CaminoSiguiente).

posicionEsValida(Laberinto, Posicion):-
    celda(Laberinto, Posicion, ..).
posicionEsValida(Laberinto, Posicion):-
    celda(Laberinto, Posicion, <>).

direccion(arriba).
direccion(abajo).
direccion(izquierda).
direccion(derecha).

siguientePosicion(Posicion, Direccion, NuevaPosicion):-
    direccion(Direccion),
    nuevaPosicionSegun(Posicion, Direccion, NuevaPosicion).

nuevaPosicionSegun(posicion(X, Y), arriba, posicion(X, NuevaY)):-
    NuevaY is Y - 1.
nuevaPosicionSegun(posicion(X, Y), abajo, posicion(X, NuevaY)):-
    NuevaY is Y + 1.
nuevaPosicionSegun(posicion(X, Y), izquierda, posicion(NuevaX, Y)):-
    NuevaX is X - 1.
nuevaPosicionSegun(posicion(X, Y), derecha, posicion(NuevaX, Y)):-
    NuevaX is X + 1.

celda(Laberinto, posicion(X, Y), Valor):-
    laberinto(Laberinto),
    nth1(Y, Laberinto, Fila),
    nth1(X, Fila, Valor).


