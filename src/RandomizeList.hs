module RandomizeList (randomizeList, randomizeListWithCustomBoolList) where

import Control.Monad.State
import GetValueFromBoolList (getValueByIndex)
import StandardRNGTables (standardTableBoolPrimeLength)

data RandomState where
  RandomState :: {index :: Int} -> RandomState

randomizeList :: [Int] -> [Int]
randomizeList xs = randomizeListWithCustomBoolList xs standardTableBoolPrimeLength

randomizeListWithCustomBoolList :: [Int] -> [Bool] -> [Int]
randomizeListWithCustomBoolList xs boolList = do
  let ok = checkLengths xs boolList
  if ok
    then evalState (randomizeListWithCustomBoolListSinglePass xs [] boolList) (RandomState 0)
    else error "The Pseudorandomized Int List is not the same length as the Raw Bool List"

checkLengths :: [Int] -> [Bool] -> Bool
checkLengths [] _ = error "The first List is empty"
checkLengths _ [] = error "The second List is empty"
checkLengths list1 list2 = (length list1 == length list2) || error ("Lengths not equal! First List length: " ++ show (length list1) ++ " Second List length: " ++ show (length list2))

randomizeListWithCustomBoolListSinglePass :: [Int] -> [Int] -> [Bool] -> State RandomState [Int]
randomizeListWithCustomBoolListSinglePass [] list' _ = return list'
randomizeListWithCustomBoolListSinglePass list list' boolList = do
  random <- get
  let i = index random
  let i' = i + 1
  let randomBool = getValueByIndex i boolList
  put RandomState {index = i'}
  if randomBool
    then randomizeListWithCustomBoolListSinglePass (tail list) (head list : list') boolList
    else randomizeListWithCustomBoolListSinglePass (tail list) (list' ++ [head list]) boolList
