module Coin (flipCoin, makeCoin) where

import Control.Monad.State
import GetValueFromRNGTable (getBoolByIndex)
import StandardRNGTables (standardTableBoolPrimeLength)

data CoinState where
  CoinState :: {index :: Int, rngTable :: [Bool]} -> CoinState

_exampleFlip :: [Bool]
_exampleFlip = do
  let coinState = makeCoin 0
  let flipACoin = evalState flipCoin coinState
  let flipResult1 = flipACoin
  let flipResult2 = flipACoin
  [flipResult1, flipResult2]

makeCoin :: Int -> CoinState
makeCoin i = makeCustomCoin i standardTableBoolPrimeLength

makeCustomCoin :: Int -> [Bool] -> CoinState
makeCustomCoin i table = CoinState {index = i, rngTable = table}

flipCoin :: State CoinState Bool
flipCoin = do
  coin <- get
  let i = index coin
  let table = rngTable coin
  put CoinState {index = i + 1, rngTable = table}
  return (getBoolByIndex i table)