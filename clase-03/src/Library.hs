{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Eta reduce" #-}
module Library where

import Data.List (isPrefixOf)
import GHC.OldList (isSuffixOf)
import PdePreludat

---------------------
------ Parte 0 ------
---------------------

-- Vamos a modelar una parte del juego Uno.
-- Queremos tener una función que nos diga si una carta puede jugarse después de otra.
-- Por ahora, vamos a arrancar implementando solo las cartas con números.

data Carta = UnaCarta Number Color deriving (Eq)

instance Show Carta where
    show (UnaCarta unNumero unColor) =
        show unNumero ++ "--" ++ show unColor

-- type Carta = (Number, String)
-- si usamos type,  Carta == (Number, String)
-- si usamos data, Carta != (Number, String)

data Color = Rojo | Azul | Amarillo | Verde deriving (Show, Eq)

carta :: Number -> Color -> Carta
carta numero color = UnaCarta numero color

color :: Carta -> Color
color (UnaCarta unNumero unColor) = unColor

tienenMismoColor :: Carta -> Carta -> Bool
tienenMismoColor unaCarta otraCarta = color unaCarta == color otraCarta

numero :: Carta -> Number
numero (UnaCarta unNumero unColor) = unNumero

tienenMismoNumero :: Carta -> Carta -> Bool
tienenMismoNumero unaCarta otraCarta = numero unaCarta == numero otraCarta

sePuedeJugar :: Carta -> Carta -> Bool
sePuedeJugar unaCarta otraCarta = tienenMismoColor unaCarta otraCarta || tienenMismoNumero unaCarta otraCarta

---------------------
------ Parte 1 ------
---------------------

-- Hay jugadores, que tienen un nombre y una cantidad de puntos que obtuvieron
-- por sus resultados en partidas de uno.
-- Queremos poder pedirle su nombre y también sus puntos.
data Jugador = UnJugador Number String deriving (Show, Eq)

jugador puntos nombre = UnJugador puntos nombre

juan :: Jugador
juan = jugador 10 "Juan"

nombre :: Jugador -> String
nombre (UnJugador _ unNombre) = unNombre

-- Ejemplo:
-- nombre juan
-- > "Juan"

puntos :: Jugador -> Number
puntos (UnJugador unosPuntos _) = unosPuntos

-- Ejemplo:
-- puntos juan
-- > 10

---------------------
------ Parte 2 ------
---------------------

-- Queremos saber entre dos jugadores, quien tiene mas puntos.
-- Si ambos tienen la misma cantidad de puntos, me da el primero que le pasé.
-- Nota: esto tiene que devolver un jugador.
juani = jugador 12 "Juani"

quienTieneMasPuntos unJugador otroJugador = implementame

-- Queremos registrarle a un jugador el resultado de una partida:
-- si el resultado es que ganó, suma 3 puntos
-- si el resultado es que empató, suma 1 punto
-- si el resultado es que perdió, suma 0 puntos

sumarPuntos :: Number -> Jugador -> Jugador
sumarPuntos cantidad unJugador = jugador (puntos unJugador + cantidad)
                                         (nombre unJugador)

trasJugarPartida :: Jugador -> String -> Jugador
trasJugarPartida unJugador "Gano" = sumarPuntos 3 unJugador
trasJugarPartida unJugador "Empato" = sumarPuntos 1 unJugador
trasJugarPartida unJugador "Perdio" = unJugador

---------------------
------ Parte 3 ------
---------------------

-- Queremos agregar la carta de Mas4.
-- Esta carta tiene un color, que es el color que va a tener que usar el siguiente jugador,
-- pero no tiene número. Además, se puede jugar encima de cualquier otra carta.
-- Modifiquen la implementación de `sePuedeJugarDespuesDe` para poder usar cartas de Mas4.

-- BONUS: Queremos agregar las cartas de Reversa y SaltarTurno.
-- Estas cartas se pueden jugar sobre una que tenga el mismo simbolo o
-- sobre una que tenga el mismo color.

---------------------
------ Parte 4 ------
---------------------

-- Queremos saber si una carta es igual a otra.

-- Queremos saber si un jugador es menor o igual a otro,
-- esto se cumple si tiene menor o igual cantidad de puntos.
