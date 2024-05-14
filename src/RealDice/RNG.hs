module RealDice.RNG (RNG, randomInt, randomFloat, randomDouble, makeRNG, makeRNGCustom) where

import Control.Monad.State
import RealDice.Generate.StandardRNGTables (standardTableIntPrimeLength)
import RealDice.Manipulate.GetValueFromRNGTable (getIntByIndex)
import RealDice.Manipulate.RandomizeList (randomizeList)

data RNG where
  RNG :: {index :: Int, rngTable :: [Int]} -> RNG

makeRNG :: Int -> RNG
makeRNG i = makeRNGCustom i standardTableIntPrimeLength

makeRNGCustom :: Int -> [Int] -> RNG
makeRNGCustom i table = RNG {index = i, rngTable = table}

-- _exampleRandomInt :: [Int]
-- _exampleRandomInt = do
--   let rngState = makeRNG 0
--   let (randomIntResult1, rngState') = runState (randomInt 2000 3000) rngState
--   let randomIntResult2 = evalState (randomInt (-99) 99) rngState'
--   [randomIntResult1, randomIntResult2]

randomInt :: (Int, Int) -> RNG -> (Int, RNG)
randomInt (minResult, maxResult) rng = do
  let rngIndex = index rng
  let rngIndex' = rngIndex + 1
  let possibleResults = randomizeList [minResult .. maxResult]
  let table = rngTable rng
  let resultIndex = getIntByIndex rngIndex table
  let rng' = RNG {index = rngIndex', rngTable = table}
  (getIntByIndex resultIndex possibleResults, rng')

randomFloat :: Int -> State RNG Float
randomFloat decimalPrecision = randomFloatPerDecimal decimalPrecision 0

randomFloatPerDecimal :: Int -> Float -> State RNG Float
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
  put RNG {index = rngIndex', rngTable = table}
  randomFloatPerDecimal decimalPlace' currentFloat'

randomDouble :: Int -> State RNG Double
randomDouble decimalPrecision = randomDoublePerDecimal decimalPrecision 0

randomDoublePerDecimal :: Int -> Double -> State RNG Double
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
  put RNG {index = rngIndex', rngTable = table}
  randomDoublePerDecimal decimalPlace' currentDouble'
