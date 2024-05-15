module RealDice.Coin (CoinGen, flipCoin, mkCoinGen, makeCoinGenCustom) where

import RealDice.Generate.StandardRNGTables (standardTableBoolPrimeLength)
import RealDice.Manipulate.GetValueFromRNGTable (getBoolByIndex)

data CoinGen where
  CoinGen :: {index :: Int, rngTable :: [Bool]} -> CoinGen

mkCoinGen :: Int -> CoinGen
mkCoinGen i = makeCoinGenCustom i standardTableBoolPrimeLength

makeCoinGenCustom :: Int -> [Bool] -> CoinGen
makeCoinGenCustom i table = CoinGen {index = i, rngTable = table}

flipCoin :: CoinGen -> (Bool, CoinGen)
flipCoin coin = (getBoolByIndex (index coin) (rngTable coin), CoinGen {index = index coin + 1, rngTable = rngTable coin})
