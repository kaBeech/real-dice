module RealDice.Die (DieGen, roll1d, mkDieGen, mkDieGenCustom) where

import RealDice.Generate.StandardRNGTables (standardTableIntPrimeLength)
import RealDice.Manipulate.GetValueFromRNGTable (getIntByIndex)
import RealDice.Manipulate.RandomizeList (randomizeList)

data DieGen where
  DieGen :: {index :: Int, rngTable :: [Int]} -> DieGen

mkDieGen :: Int -> DieGen
mkDieGen i = mkDieGenCustom i standardTableIntPrimeLength

mkDieGenCustom :: Int -> [Int] -> DieGen
mkDieGenCustom i table = DieGen {index = i, rngTable = table}

roll1d :: Int -> DieGen -> (Int, DieGen)
roll1d n die = do
  let rngIndex = index die
  let rngIndex' = rngIndex + 1
  let diceValues = randomizeList [1 .. n]
  let table = rngTable die
  let rollIndex = getIntByIndex rngIndex table
  let die' = DieGen {index = rngIndex', rngTable = table}
  (getIntByIndex rollIndex diceValues, die')
