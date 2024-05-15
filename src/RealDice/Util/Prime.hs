module RealDice.Util.Prime (greatestPrimeNotGreaterThan) where

import Data.Numbers.Primes (isPrime)

greatestPrimeNotGreaterThan :: Int -> Int
greatestPrimeNotGreaterThan n
  | n < 1 = 0
  | n == 1 = 1
  | isPrime n = n
  | otherwise = greatestPrimeNotGreaterThan (n - 1)
