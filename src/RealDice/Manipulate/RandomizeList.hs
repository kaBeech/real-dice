module RealDice.Manipulate.RandomizeList (randomizeList, randomizeListWithCustomBoolList) where

import Control.Monad.State
import RealDice.Generate.StandardRNGTables (standardTableBoolPrimeLength)
import RealDice.Manipulate.GetValueFromRNGTable (getBoolByIndex)

data RandomState where
  RandomState :: {index :: Int} -> RandomState

randomizeList :: [Int] -> [Int]
randomizeList xs = randomizeListWithCustomBoolList xs standardTableBoolPrimeLength

randomizeListWithCustomBoolList :: [Int] -> [Bool] -> [Int]
randomizeListWithCustomBoolList xs boolList = do
  evalState (randomizeListWithCustomBoolListSinglePass xs [] boolList) (RandomState 0)

randomizeListWithCustomBoolListSinglePass :: [Int] -> [Int] -> [Bool] -> State RandomState [Int]
randomizeListWithCustomBoolListSinglePass [] list' _ = return list'
randomizeListWithCustomBoolListSinglePass list list' boolList = do
  random <- get
  let i = index random
  let i' = i + 1
  let randomBool = getBoolByIndex i boolList
  put RandomState {index = i'}
  if randomBool
    then randomizeListWithCustomBoolListSinglePass (tail list) (head list : list') boolList
    else randomizeListWithCustomBoolListSinglePass (tail list) (list' ++ [head list]) boolList
