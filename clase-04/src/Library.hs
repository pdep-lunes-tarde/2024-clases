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
primero :: [a] -> a
primero (x : _) = x


elResto :: [a] -> [a]
elResto (_ : xs) = xs


estaVacia :: Eq a => [a] -> Bool
estaVacia [] = True
estaVacia _ = False

-- estaVacia lista = lista == []

-- agregar 0 [1,2,3] deberia ser [0,1,2,3]
-- [] /// Lista Vacia
-- (x : xs) /// Cabeza y Cola

-- agregar elemento (x : xs) = elemento : x : xs
-- agregar elemento [] = elemento : []
agregar :: a -> [a] -> [a]
agregar elemento lista = elemento : lista

-- ultimo ["hola", "que", "tal"] deberia ser "tal"
ultimo = implementame

-- cantidad ["hola", "que", "tal"] deberia ser 3
cantidad = implementame

-- tiene 3 [1,2,3] deberia ser True
-- tiene 4 [1,2,3] deberia ser False
tiene = implementame

-- agregarAlFinal 1 [1,2,3] deberia ser [1,2,3,1]
agregarAlFinal = implementame

-- agregarTodos [1,2,3] [4,5,6] = [1,2,3,4,5,6]
agregarTodos = implementame