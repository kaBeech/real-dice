module RealDice.Coin (CoinGen, flipCoin, mkCoinGen, mkCoinGenCustom) where

import RealDice.Generate.BalancedTables (rdBoolsPrime)
import RealDice.Manipulate.GetValueFromRNGTable (getBoolByIndex)

-- | Stores a balanced table of random boolean values and an index pointing at the next value to return
data CoinGen where
  CoinGen :: {index :: Int, boolTable :: [Bool]} -> CoinGen

-- | Creates a new CoinGen with the given index and the default bool table
mkCoinGen :: Int -> CoinGen
mkCoinGen i = mkCoinGenCustom i rdBoolsPrime

-- | Creates a new CoinGen with the given index and bool table
mkCoinGenCustom :: Int -> [Bool] -> CoinGen
mkCoinGenCustom i [] = CoinGen {index = i, boolTable = rdBoolsPrime}
mkCoinGenCustom i table = CoinGen {index = i, boolTable = table}

-- | Generates random boolean values via a simple table lookup
flipCoin :: CoinGen -> (Bool, CoinGen)
flipCoin coin =
  ( getBoolByIndex (index coin) (boolTable coin),
    CoinGen {index = index coin + 1, boolTable = boolTable coin}
  )
