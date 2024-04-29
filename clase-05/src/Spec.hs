module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Tests de clase 5" $ do
    describe "esDeTipoElectrico" $ do
      it "es verdad si el pokemon es de tipo electrico" $
        esDeTipoElectrico pikachu `shouldBe` True
      it "es falso si el pokemon no es de tipo electrico" $
        esDeTipoElectrico squirtle `shouldBe` False
    describe "esFuerte" $ do
      it "si tiene mas de 1000 de experiencia es verdad" $ do
        esFuerte otroPikachu `shouldBe` True
      it "si tiene exactamente 1000 de experiencia es verdad" $ do
        esFuerte squirtle `shouldBe` True
      it "si tiene menos de 1000 de experiencia es falso" $ do
        esFuerte charmander `shouldBe` False
    describe "esRaro" $ do
      it "si no es de tipo fuego es falso" $ do
        esRaro otroPikachu `shouldBe` False
      it "si no es fuerte es falso" $ do
        esRaro charmander `shouldBe` False
      it "si es de tipo fuego y es fuerte, entonces es verdad" $ do
        esRaro charizard `shouldBe` True