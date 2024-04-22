{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
module Library where
import PdePreludat

-- Recursividad
-- https://pbv.github.io/haskelite/site/index.html

-- multiplicar 2 por 3 deberia ser equivalente a 2 + 2 + 2, o sea 6
multiplicar :: Number -> Number -> Number
multiplicar a 0 = 0
multiplicar a b | b > 0 = a + multiplicar a (b - 1)
multiplicar a b | b < 0 = multiplicar a (b + 1) - a

-- Listas
-- Tienen dos constructores

-- primero [1,2,3] deberia ser 1



elResto :: [a] -> [a]
elResto (_ : xs) = xs


estaVacia :: Eq a => [a] -> Bool
estaVacia [] = True
estaVacia _ = False

-- estaVacia lista = lista == []

-- agregar 0 [1,2,3] deberia ser [0,1,2,3]


-- agregar elemento (x : xs) = elemento : x : xs
-- agregar elemento [] = elemento : []
agregar :: a -> [a] -> [a]
agregar elemento lista = elemento : lista

primero :: [a] -> a
primero (x : _) = x

-- ultimo ["hola", "que", "tal"] deberia ser "tal"
ultimo :: [a] -> a
ultimo (x : []) = x
-- ultimo [x] = x
ultimo (x : xs) = ultimo xs

-- [] /// Lista Vacia
-- (x : xs) /// Cabeza y Cola
-- cantidad ["hola", "que", "tal"] deberia ser 3
cantidad :: [a] -> Number
cantidad [] = 0
cantidad (x : xs) = 1 + cantidad xs

-- tiene 3 [1,2,3] deberia ser True
-- tiene 4 [1,2,3] deberia ser False
tiene :: Eq a => a -> [a] -> Bool
tiene elemento [] = False
tiene elemento (primero : resto) =
    elemento == primero || tiene elemento resto

-- agregarAlFinal 1 [1,2,3] deberia ser [1,2,3,1]
agregarAlFinal :: a -> [a] -> [a]
agregarAlFinal elemento [] = [elemento]
agregarAlFinal elemento (x : xs) =
    x : agregarAlFinal elemento xs

-- agregarTodos [1,2,3] [4,5,6] = [1,2,3,4,5,6]
agregarTodos :: [a] -> [a] -> [a]
agregarTodos [] unaLista = unaLista
agregarTodos unaLista [] = unaLista
agregarTodos unaLista (primero:resto) =
    agregarTodos (agregarAlFinal primero unaLista) resto

agregarTodos unaLista otraLista =
    unaLista ++ otraLista
