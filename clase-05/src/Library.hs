module Library where
import PdePreludat

data Entrenador = Entrenador { 
    cantidadPokebolas :: Number, 
    pokemons :: [Pokemon] 
    } deriving(Eq, Show)

data Tipo = Electrico | Fuego | Agua deriving(Eq, Show)

data Pokemon = Pokemon {
    tipo :: Tipo, 
    experiencia :: Number 
    } deriving(Eq, Show)

entrenador :: Entrenador
entrenador = Entrenador 10 [pikachu, charmander, squirtle]

pikachu :: Pokemon
pikachu = Pokemon Electrico 0

otroPikachu :: Pokemon
otroPikachu = Pokemon Electrico 2500

charmander :: Pokemon
charmander = Pokemon Fuego 200

charizard :: Pokemon
charizard = Pokemon Fuego 5000

squirtle :: Pokemon
squirtle = Pokemon Agua 1000

esDeTipoElectrico :: Pokemon -> Bool
esDeTipoElectrico pokemon = esDeTipo pokemon Electrico

esDeTipoAgua :: Pokemon -> Bool
esDeTipoAgua pokemon = esDeTipo pokemon Agua

esDeTipoFuego :: Pokemon -> Bool
esDeTipoFuego pokemon = esDeTipo pokemon Fuego

esDeTipo :: Pokemon -> Tipo -> Bool
esDeTipo pokemon unTipo = tipo pokemon == unTipo

esFuerte :: Pokemon -> Bool
esFuerte pokemon = experiencia pokemon >= 1000

esRaro :: Pokemon -> Bool
esRaro pokemon = esDeTipoFuego pokemon && esFuerte pokemon