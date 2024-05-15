module RealDice.RNG (RDGen, randomIntR, randomFloat, randomDouble, mkRDGen, mkRDGenCustom) where

import Control.Monad.State
import RealDice.Generate.StandardRNGTables (standardTableIntPrimeLength)
import RealDice.Manipulate.GetValueFromRNGTable (getIntByIndex)
import RealDice.Manipulate.RandomizeList (randomizeList)

data RDGen where
  RDGen :: {index :: Int, rngTable :: [Int]} -> RDGen

mkRDGen :: Int -> RDGen
mkRDGen i = mkRDGenCustom i standardTableIntPrimeLength

mkRDGenCustom :: Int -> [Int] -> RDGen
mkRDGenCustom i table = RDGen {index = i, rngTable = table}

-- _exampleRandomInt :: [Int]
-- _exampleRandomInt = do
--   let rngState = mkRDGen 0
--   let (randomIntResult1, rngState') = runState (randomIntR 2000 3000) rngState
--   let randomIntResult2 = evalState (randomIntR (-99) 99) rngState'
--   [randomIntResult1, randomIntResult2]

randomIntR :: (Int, Int) -> RDGen -> (Int, RDGen)
randomIntR (minResult, maxResult) rng = do
  let rngIndex = index rng
  let rngIndex' = rngIndex + 1
  let possibleResults = randomizeList [minResult .. maxResult]
  let table = rngTable rng
  let resultIndex = getIntByIndex rngIndex table
  let rng' = RDGen {index = rngIndex', rngTable = table}
  (getIntByIndex resultIndex possibleResults, rng')

randomFloat :: Int -> State RDGen Float
randomFloat decimalPrecision = randomFloatPerDecimal decimalPrecision 0

randomFloatPerDecimal :: Int -> Float -> State RDGen Float
randomFloatPerDecimal 0 currentFloat = do
  return currentFloat
randomFloatPerDecimal decimalPlace currentFloat = do
  rng <- get
  let rngIndex = index rng
  let rngIndex' = rngIndex + 1
  let possibleResults = randomizeList [0 .. 9]
  let table = rngTable rng
  let resultIndex = getIntByIndex rngIndex table
  let digit = getIntByIndex resultIndex possibleResults
  let decimalPlace' = decimalPlace - 1
  let currentFloat' = currentFloat + (fromIntegral digit / (10 ^ decimalPlace))
  put RDGen {index = rngIndex', rngTable = table}
  randomFloatPerDecimal decimalPlace' currentFloat'

randomDouble :: Int -> State RDGen Double
randomDouble decimalPrecision = randomDoublePerDecimal decimalPrecision 0

randomDoublePerDecimal :: Int -> Double -> State RDGen Double
randomDoublePerDecimal 0 currentDouble = do
  return currentDouble
randomDoublePerDecimal decimalPlace currentDouble = do
  rng <- get
  let rngIndex = index rng
  let rngIndex' = rngIndex + 1
  let possibleResults = randomizeList [0 .. 9]
  let table = rngTable rng
  let resultIndex = getIntByIndex rngIndex table
  let digit = getIntByIndex resultIndex possibleResults
  let decimalPlace' = decimalPlace - 1
  let currentDouble' = currentDouble + (fromIntegral digit / (10 ^ decimalPlace))
  put RDGen {index = rngIndex', rngTable = table}
  randomDoublePerDecimal decimalPlace' currentDouble'
