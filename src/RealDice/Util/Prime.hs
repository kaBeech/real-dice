module RealDice.Util.Prime (greatestPrimeNotGreaterThan) where

import Data.Numbers.Primes (isPrime)

greatestPrimeNotGreaterThan :: Int -> Int
greatestPrimeNotGreaterThan n = head $ filter isPrime [n, n - 1 ..]
