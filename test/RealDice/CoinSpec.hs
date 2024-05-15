{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use camelCase" #-}
module RealDice.CoinSpec (doesnt_give_same_result_10_times) where

import Control.Monad.State
import Data.List.Extra
import RealDice.Coin (CoinGen, flipCoin, mkCoinGen)
import Test.QuickCheck

data CoinState where
  CoinState :: {generator :: CoinGen} -> CoinState

generateFlips :: Int -> [Bool]
generateFlips n = evalState (generateFlipsSinglePass 10 []) (CoinState (mkCoinGen n))

generateFlipsSinglePass :: Int -> [Bool] -> State CoinState [Bool]
generateFlipsSinglePass 0 flips = return flips
generateFlipsSinglePass i flips = do
  coinSt <- get
  let gen = generator coinSt
  let (randomInteger, gen') = flipCoin gen
  put CoinState {generator = gen'}
  generateFlipsSinglePass (i - 1) (randomInteger : flips)

doesnt_give_same_result_10_times :: Int -> Property
doesnt_give_same_result_10_times n = n > 0 ==> not (allSame (generateFlips n))

--
-- returns_many_unique_numbers :: Int -> Property
-- returns_many_unique_numbers n =
--   n
--     > 0
--     ==> do
--       let list = generateRandomNumbers n
--       head list `elem` tail list
--
--
-- coinState :: (makeCoin g, Int) => State g a
-- coinState = State makeCoin 0
--
-- testDataFlip :: [Bool]
-- testDataFlip = do
--   let (flipResult1, coinState') = runState flipCoin coinState
--   let (flipResult2, coinState'') = runState flipCoin coinState'
--   let (flipResult3, coinState''') = runState flipCoin coinState''
--   let (flipResult4, coinState'''') = runState flipCoin coinState'''
--   let flipResult5 = evalState flipCoin coinState''''
--   [flipResult1, flipResult2, flipResult3, flipResult4, flipResult5]
--
-- result_is_prime :: Int -> Property
-- result_is_prime n = n > 1 ==> isPrime (greatestPrimeNotGreaterThan n)
--
-- result_is_less_than_or_equal_to_input :: Int -> Property
-- result_is_less_than_or_equal_to_input n = n > 1 ==> greatestPrimeNotGreaterThan n <= n
--
-- next_largest_prime_is_larger_than_input :: Int -> Property
-- next_largest_prime_is_larger_than_input n = do
--   let result = greatestPrimeNotGreaterThan n
--   n > 1 ==> n < head (filter isPrime [result + 1, result + 2 ..])
