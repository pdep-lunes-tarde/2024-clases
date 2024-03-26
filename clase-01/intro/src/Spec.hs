module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
    it "un anio es bisiesto si es divisible por 400" $ do
        esBisiesto 800 `shouldBe` True
    it "un anio es bisiesto si es divisible por 4 pero no por 100" $ do
        esBisiesto 104 `shouldBe` True
    it "un anio no es bisiesto si no es divisible por 4" $ do
        esBisiesto 7 `shouldBe` False
    it "un anio no es bisiesto si es divisible por 4 y 100, pero no por 400" $ do
        esBisiesto 100 `shouldBe` False
