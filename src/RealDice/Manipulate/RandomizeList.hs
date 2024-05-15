module RealDice.Manipulate.RandomizeList
  ( randomizeList,
    randomizeWithCustomBools,
  )
where

import Control.Monad.State
import RealDice.Generate.BalancedTables (rdBoolsPrime)
import RealDice.Manipulate.GetValueFromRNGTable (getBoolByIndex)

data RandomState where
  RandomState :: {index :: Int} -> RandomState

randomizeList :: [Int] -> [Int]
randomizeList xs = randomizeWithCustomBools xs rdBoolsPrime

randomizeWithCustomBools :: [Int] -> [Bool] -> [Int]
randomizeWithCustomBools xs boolList =
  evalState
    (randomizeListWithCustomBoolListSinglePass xs [] boolList)
    (RandomState 0)

randomizeListWithCustomBoolListSinglePass :: [Int] -> [Int] -> [Bool] -> State RandomState [Int]
randomizeListWithCustomBoolListSinglePass [] l' _ = return l'
randomizeListWithCustomBoolListSinglePass l l' boolList = do
  random <- get
  put RandomState {index = index random + 1}
  if getBoolByIndex (index random) boolList
    then
      randomizeListWithCustomBoolListSinglePass
        (tail l)
        (head l : l')
        boolList
    else
      randomizeListWithCustomBoolListSinglePass
        (tail l)
        (l' ++ [head l])
        boolList
