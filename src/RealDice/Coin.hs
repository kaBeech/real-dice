module RealDice.Coin (CoinGen, flipCoin, mkCoinGen, mkCoinGenCustom) where

import RealDice.Generate.BalancedTables (rdBoolsPrime)
import RealDice.Manipulate.GetValueFromRNGTable (getBoolByIndex)

data CoinGen where
  CoinGen :: {index :: Int, boolTable :: [Bool]} -> CoinGen

mkCoinGen :: Int -> CoinGen
mkCoinGen i = mkCoinGenCustom i rdBoolsPrime

mkCoinGenCustom :: Int -> [Bool] -> CoinGen
mkCoinGenCustom i table = CoinGen {index = i, boolTable = table}

flipCoin :: CoinGen -> (Bool, CoinGen)
flipCoin coin =
  ( getBoolByIndex (index coin) (boolTable coin),
    CoinGen {index = index coin + 1, boolTable = boolTable coin}
  )
