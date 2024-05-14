{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use camelCase" #-}
module RealDice.RNGSpec (returns_many_unique_numbers) where

import Control.Monad.State
import RealDice.RNG (RNG, makeRNG, randomInt)
import Test.QuickCheck

data RandomState where
  RandomState :: {generator :: RNG} -> RandomState

generateRandomNumbers :: Int -> [Int]
generateRandomNumbers n = evalState (generateRandomNumbersSinglePass 24 []) (RandomState (makeRNG n))

generateRandomNumbersSinglePass :: Int -> [Int] -> State RandomState [Int]
generateRandomNumbersSinglePass 0 generatedNumbers = return generatedNumbers
generateRandomNumbersSinglePass i generatedNumbers = do
  randomSt <- get
  let gen = generator randomSt
  let (randomInteger, gen') = randomInt (0, 1000) gen
  put RandomState {generator = gen'}
  generateRandomNumbersSinglePass (i - 1) (randomInteger : generatedNumbers)

returns_many_unique_numbers :: Int -> Property
returns_many_unique_numbers n =
  n
    > 0
    ==> do
      let generatedNumbers = generateRandomNumbers n
      head generatedNumbers `notElem` tail generatedNumbers
