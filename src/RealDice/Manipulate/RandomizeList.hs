module RealDice.Manipulate.RandomizeList
  ( randomizeList,
    randomizeListWithCustomBoolList,
  )
where

import Control.Monad.State
import RealDice.Generate.StandardRNGTables (standardTableBoolPrimeLength)
import RealDice.Manipulate.GetValueFromRNGTable (getBoolByIndex)

data RandomState where
  RandomState :: {index :: Int} -> RandomState

randomizeList :: [Int] -> [Int]
randomizeList xs = randomizeListWithCustomBoolList xs standardTableBoolPrimeLength

randomizeListWithCustomBoolList :: [Int] -> [Bool] -> [Int]
randomizeListWithCustomBoolList xs boolList =
  evalState
    (randomizeListWithCustomBoolListSinglePass xs [] boolList)
    (RandomState 0)

randomizeListWithCustomBoolListSinglePass :: [Int] -> [Int] -> [Bool] -> State RandomState [Int]
randomizeListWithCustomBoolListSinglePass [] list' _ = return list'
randomizeListWithCustomBoolListSinglePass list list' boolList = do
  random <- get
  put RandomState {index = index random + 1}
  if getBoolByIndex (index random) boolList
    then
      randomizeListWithCustomBoolListSinglePass
        (tail list)
        (head list : list')
        boolList
    else
      randomizeListWithCustomBoolListSinglePass
        (tail list)
        (list' ++ [head list])
        boolList
