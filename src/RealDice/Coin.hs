module RealDice.Coin (CoinGen, flipCoin, mkCoinGen, makeCoinGenCustom) where

import RealDice.Generate.StandardRNGTables (standardTableBoolPrimeLength)
import RealDice.Manipulate.GetValueFromRNGTable (getBoolByIndex)

data CoinGen where
  CoinGen :: {index :: Int, boolTable :: [Bool]} -> CoinGen

mkCoinGen :: Int -> CoinGen
mkCoinGen i = makeCoinGenCustom i standardTableBoolPrimeLength

makeCoinGenCustom :: Int -> [Bool] -> CoinGen
makeCoinGenCustom i table = CoinGen {index = i, boolTable = table}

flipCoin :: CoinGen -> (Bool, CoinGen)
flipCoin coin =
  ( getBoolByIndex (index coin) (boolTable coin),
    CoinGen {index = index coin + 1, boolTable = boolTable coin}
  )
