module RealDice.RNG (randomInt, randomFloat, randomDouble, makeRNG, makeRNGCustom) where

import Control.Monad.State
import RealDice.Generate.StandardRNGTables (standardTableIntPrimeLength)
import RealDice.Manipulate.GetValueFromRNGTable (getIntByIndex)
import RealDice.Manipulate.RandomizeList (randomizeList)

data RNGState where
  RNGState :: {index :: Int, rngTable :: [Int]} -> RNGState

makeRNG :: Int -> RNGState
makeRNG i = makeRNGCustom i standardTableIntPrimeLength

makeRNGCustom :: Int -> [Int] -> RNGState
makeRNGCustom i table = RNGState {index = i, rngTable = table}

-- _exampleRandomInt :: [Int]
-- _exampleRandomInt = do
--   let rngState = makeRNG 0
--   let (randomIntResult1, rngState') = runState (randomInt 2000 3000) rngState
--   let randomIntResult2 = evalState (randomInt (-99) 99) rngState'
--   [randomIntResult1, randomIntResult2]

randomInt :: Int -> Int -> State RNGState Int
randomInt minResult maxResult = do
  rng <- get
  let rngIndex = index rng
  let rngIndex' = rngIndex + 1
  let possibleResults = randomizeList [minResult .. maxResult]
  let table = rngTable rng
  let resultIndex = getIntByIndex rngIndex table
  put RNGState {index = rngIndex', rngTable = table}
  return (getIntByIndex resultIndex possibleResults)

randomFloat :: Int -> State RNGState Float
randomFloat decimalPrecision = randomFloatPerDecimal decimalPrecision 0

randomFloatPerDecimal :: Int -> Float -> State RNGState Float
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
  put RNGState {index = rngIndex', rngTable = table}
  randomFloatPerDecimal decimalPlace' currentFloat'

randomDouble :: Int -> State RNGState Double
randomDouble decimalPrecision = randomDoublePerDecimal decimalPrecision 0

randomDoublePerDecimal :: Int -> Double -> State RNGState Double
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
  put RNGState {index = rngIndex', rngTable = table}
  randomDoublePerDecimal decimalPlace' currentDouble'
