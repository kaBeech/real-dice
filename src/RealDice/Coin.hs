module RealDice.Coin (flipCoin, makeCoin, makeCoinCustom) where

import Control.Monad.State
import RealDice.Generate.StandardRNGTables (standardTableBoolPrimeLength)
import RealDice.Manipulate.GetValueFromRNGTable (getBoolByIndex)

data CoinState where
  CoinState :: {index :: Int, rngTable :: [Bool]} -> CoinState

makeCoin :: Int -> CoinState
makeCoin i = makeCoinCustom i standardTableBoolPrimeLength

makeCoinCustom :: Int -> [Bool] -> CoinState
makeCoinCustom i table = CoinState {index = i, rngTable = table}

-- _exampleFlip :: [Bool]
-- _exampleFlip = do
--   let coinState = makeCoin 0
--   let (flipResult1, coinState') = runState flipCoin coinState
--   let (flipResult2, coinState'') = runState flipCoin coinState'
--   let (flipResult3, coinState''') = runState flipCoin coinState''
--   let (flipResult4, coinState'''') = runState flipCoin coinState'''
--   let flipResult5 = evalState flipCoin coinState''''
--   [flipResult1, flipResult2, flipResult3, flipResult4, flipResult5]

flipCoin :: State CoinState Bool
flipCoin = do
  coin <- get
  let i = index coin
  let table = rngTable coin
  put CoinState {index = i + 1, rngTable = table}
  return (getBoolByIndex i table)
