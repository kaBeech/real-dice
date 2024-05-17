-- | Module for finding the greatest prime number that is less than or equal to
-- | a given number
module RealDice.Util.Prime (greatestPrimeNotGreaterThan) where

import Data.Numbers.Primes (isPrime)

-- | Returns the greatest prime number that is not greater than the given number

-- | Returns 1 if given the number 1 and 0 for any lower number

-- | See RealDice.Generate.RawData for reasons for use

-- | ==== __Examples__
-- | >>> greatestPrimeNotGreaterThan 10
-- | 7
-- | >>> greatestPrimeNotGreaterThan 1024
-- | 1019
-- | >>> greatestPrimeNotGreaterThan 1
-- | 1
-- | >>> greatestPrimeNotGreaterThan 0
-- | 0
-- | >>> greatestPrimeNotGreaterThan -1024
-- | 0
greatestPrimeNotGreaterThan :: Int -> Int
greatestPrimeNotGreaterThan n
  | n < 1 = 0
  | n == 1 = 1
  | isPrime n = n
  | otherwise = greatestPrimeNotGreaterThan (n - 1)
