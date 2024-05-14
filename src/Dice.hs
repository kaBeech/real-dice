module Dice (roll1d, makeDice, _exampleRoll) where

import Control.Monad.State
import GetValueFromRNGTable (getIntByIndex)
import RandomizeList (randomizeList)
import StandardRNGTables (standardTableIntPrimeLength)

data DiceState where
  DiceState :: {index :: Int, rngTable :: [Int]} -> DiceState

-- _exampleRoll :: [Int]
-- _exampleRoll = do
--   let diceState = makeDice 0
--   let (rollResult1, diceState') = runState (roll1d 6) diceState
--   let rollResult2 = evalState (roll1d 6) diceState'
--   [rollResult1, rollResult2]

makeDice :: Int -> DiceState
makeDice i = makeCustomDice i standardTableIntPrimeLength

makeCustomDice :: Int -> [Int] -> DiceState
makeCustomDice i table = DiceState {index = i, rngTable = table}

roll1d :: Int -> State DiceState Int
roll1d n = do
  dice <- get
  let rngIndex = index dice
  let rngIndex' = rngIndex + 1
  let diceValues = randomizeList [1 .. n]
  let table = rngTable dice
  let rollIndex = getIntByIndex rngIndex table
  put DiceState {index = rngIndex', rngTable = table}
  return (getIntByIndex rollIndex diceValues)
