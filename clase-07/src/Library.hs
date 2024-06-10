{-# LANGUAGE BangPatterns #-}
module Library where
import PdePreludat

unos :: [Number]
unos = 1 : unos

repetir :: a -> [a]
repetir x = x : repetir x

-- replicar 3 "hola" -> ["hola", "hola", "hola"]
replicar :: Number -> a -> [a]
replicar numero x = (take numero . repetir) x

-- [1,2,3,4,5,6,7...]
naturales :: [Number]
naturales = 1 : map (+1) naturales

losNaturalesPares :: [Number]
losNaturalesPares = filter even naturales
-- losNaturalesPares = 2 : map (+2) losNaturalesPares

losNaturalesImpares :: [Number]
losNaturalesImpares = filter odd naturales

serieDeFibonacci :: [Number]
serieDeFibonacci =
     0 : 1 : zipWith (+) serieDeFibonacci (tail serieDeFibonacci)

fibonacci :: Number -> Number
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci posicion = fibonacci (posicion - 2) + fibonacci (posicion - 1)

serieDeFibonacci' :: [Number]
serieDeFibonacci' = map fibonacci (0:naturales)

--     0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...
