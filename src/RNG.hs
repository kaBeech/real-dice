module RNG (randomInt, makeRNG) where

import Control.Monad.State
import GetValueFromRNGTable (getIntByIndex)
import RandomizeList (randomizeList)
import StandardRNGTables (standardTableIntPrimeLength)

data RNGState where
  RNGState :: {index :: Int, rngTable :: [Int]} -> RNGState

makeRNG :: Int -> RNGState
makeRNG i = makeCustomRNG i standardTableIntPrimeLength

makeCustomRNG :: Int -> [Int] -> RNGState
makeCustomRNG i table = RNGState {index = i, rngTable = table}

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
  let diceValues = randomizeList [minResult .. maxResult]
  let table = rngTable rng
  let rollIndex = getIntByIndex rngIndex table
  put RNGState {index = rngIndex', rngTable = table}
  return (getIntByIndex rollIndex diceValues)
