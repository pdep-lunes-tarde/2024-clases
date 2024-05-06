module Library where
import PdePreludat

data CajaRegistradora = UnaCaja{
  cajero::String,
  dinero::Integer
} deriving (Show, Eq)

cobrar dineroACobrar (UnaCaja unCajero unDinero) = UnaCaja unCajero (unDinero+dineroACobrar)


-- Punto 1: cobrar dos veces a una persona por pagar en dos cuotas

-- cobrarDosCuotas = implementame


-- Punto 2: saber si la longitud del nombre del cajero es par
-- nombreCajeroPar = implementame

-- Punto 3: queremos poder cobrar tres veces a la misma persona por dos cuotas
-- cobrarTresVecesDosCuotas = implementame


caja1 = UnaCaja "Tomi" 75
caja2 = UnaCaja "JuanFds" 120
caja3 = UnaCaja "Dante" 225
caja4 = UnaCaja "Manu" 25
caja5 = UnaCaja "Juani" 95
cajasDelSuper = [caja1, caja2, caja3, caja4, caja5]

-- Punto 4: dada una lista de cajas del supermercado, queremos saber cuales tienen mas de 100
-- pesos disponibles

-- cajasConMasDeCienPesos = implementame

-- Punto 5: queremos saber si la sumatoria de la plata en cajas es superior a
-- cierto numero

-- sumatoriaEnCajasMayorA = implementame

-- Punto 6: Por ultimo, queremos quedarnos con la primer letra del nombre
-- de la caja que tiene el cajero con nombre mas largo

-- primerLetraDeCajeroConMasDinero = implementame

maximoSegun funcion lista = foldl1 (\a b -> mayorSegun funcion a b) lista

mayorSegun :: Ord b => (a->b) -> a -> a -> a
mayorSegun funcion valor1 valor2
    | funcion valor1 > funcion valor2 = valor1  
    | otherwise = valor2
