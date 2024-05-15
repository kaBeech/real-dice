module RealDice.Die (DieGen, roll1d, mkDieGen, mkDieGenCustom) where

import RealDice.Generate.BalancedTables (rdIntsPrime)
import RealDice.Manipulate.GetValueFromRNGTable (getIntByIndex)
import RealDice.Manipulate.RandomizeList (randomizeList)

data DieGen where
  DieGen :: {index :: Int, intTable :: [Int]} -> DieGen

mkDieGen :: Int -> DieGen
mkDieGen i = mkDieGenCustom i rdIntsPrime

mkDieGenCustom :: Int -> [Int] -> DieGen
mkDieGenCustom i table = DieGen {index = i, intTable = table}

roll1d :: Int -> DieGen -> (Int, DieGen)
roll1d n die =
  ( getIntByIndex (getIntByIndex (index die) (intTable die)) (randomizeList [1 .. n]),
    DieGen {index = index die + 1, intTable = intTable die}
  )
