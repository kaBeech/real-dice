module Coin (flipCoin, makeCoin, _exampleFlip) where

import Control.Monad.State
import GetValueFromRNGTable (getBoolByIndex)
import StandardRNGTables (standardTableBoolPrimeLength)

data CoinState where
  CoinState :: {index :: Int, rngTable :: [Bool]} -> CoinState

_exampleFlip :: [Bool]
_exampleFlip = do
  let coinState = makeCoin 0
  let (flipResult1, coinState') = runState flipCoin coinState
  let (flipResult2, coinState'') = runState flipCoin coinState'
  let (flipResult3, coinState''') = runState flipCoin coinState''
  let (flipResult4, coinState'''') = runState flipCoin coinState'''
  let flipResult5 = evalState flipCoin coinState''''
  [flipResult1, flipResult2, flipResult3, flipResult4, flipResult5]

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
