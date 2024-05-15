{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use camelCase" #-}
module RealDice.RNGSpec (returns_many_unique_numbers) where

import Control.Monad.State
import RealDice.RNG (RDGen, mkRDGen, randomIntR)
import Test.QuickCheck

data RandomState where
  RandomState :: {generator :: RDGen} -> RandomState

generateRandomNumbers :: Int -> [Int]
generateRandomNumbers n =
  evalState (generateRandomNumbersSinglePass 10 []) (RandomState (mkRDGen n))

generateRandomNumbersSinglePass :: Int -> [Int] -> State RandomState [Int]
generateRandomNumbersSinglePass 0 generatedNumbers = return generatedNumbers
generateRandomNumbersSinglePass i generatedNumbers = do
  randomSt <- get
  let (randomInteger, gen') = randomIntR (0, 1000) (generator randomSt)
  put RandomState {generator = gen'}
  generateRandomNumbersSinglePass (i - 1) (randomInteger : generatedNumbers)

returns_many_unique_numbers :: Int -> Property
returns_many_unique_numbers n =
  n > 0 ==>
    head (generateRandomNumbers n) `notElem` tail (generateRandomNumbers n)
