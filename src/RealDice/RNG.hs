module RealDice.RNG (RDGen, randomIntR, randomFloat, randomDouble, mkRDGen, mkRDGenCustom) where

import RealDice.Generate.StandardRNGTables (standardTableIntPrimeLength)
import RealDice.Manipulate.GetValueFromRNGTable (getIntByIndex)
import RealDice.Manipulate.RandomizeList (randomizeList)

data RDGen where
  RDGen :: {index :: Int, rngTable :: [Int]} -> RDGen

mkRDGen :: Int -> RDGen
mkRDGen i = mkRDGenCustom i standardTableIntPrimeLength

mkRDGenCustom :: Int -> [Int] -> RDGen
mkRDGenCustom i table = RDGen {index = i, rngTable = table}

randomIntR :: (Int, Int) -> RDGen -> (Int, RDGen)
randomIntR (minResult, maxResult) rng = do
  let rngIndex = index rng
  let rngIndex' = rngIndex + 1
  let possibleResults = randomizeList [minResult .. maxResult]
  let table = rngTable rng
  let resultIndex = getIntByIndex rngIndex table
  let rng' = RDGen {index = rngIndex', rngTable = table}
  (getIntByIndex resultIndex possibleResults, rng')

-- Returns a Float between 0 and 1
randomFloat :: Int -> RDGen -> (Float, RDGen)
randomFloat decimalPrecision = randomFloatSinglePass (decimalPrecision, 0)

randomFloatSinglePass :: (Int, Float) -> RDGen -> (Float, RDGen)
randomFloatSinglePass (0, currentFloat) rng = (currentFloat, rng)
randomFloatSinglePass (decimalPlace, currentFloat) rng = do
  let randomDigit = getIntByIndex (getIntByIndex (index rng) (rngTable rng)) (randomizeList [0 .. 9])
  randomFloatSinglePass
    ( decimalPlace - 1,
      currentFloat + (fromIntegral randomDigit / (10 ^ decimalPlace))
    )
    (RDGen {index = index rng + 1, rngTable = rngTable rng})

-- Returns a Double between 0 and 1
randomDouble :: Int -> RDGen -> (Double, RDGen)
randomDouble decimalPrecision = randomDoubleSinglePass (decimalPrecision, 0)

randomDoubleSinglePass :: (Int, Double) -> RDGen -> (Double, RDGen)
randomDoubleSinglePass (0, currentDouble) rng = (currentDouble, rng)
randomDoubleSinglePass (decimalPlace, currentDouble) rng = do
  let randomDigit = getIntByIndex (getIntByIndex (index rng) (rngTable rng)) (randomizeList [0 .. 9])
  randomDoubleSinglePass
    ( decimalPlace - 1,
      currentDouble + (fromIntegral randomDigit / (10 ^ decimalPlace))
    )
    (RDGen {index = index rng + 1, rngTable = rngTable rng})
