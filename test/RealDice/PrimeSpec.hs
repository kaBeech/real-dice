{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use camelCase" #-}
module RealDice.PrimeSpec (result_is_less_than_or_equal_to_input, result_is_prime, next_largest_prime_is_larger_than_input) where

import Data.Numbers.Primes (isPrime)
import RealDice.Util.Prime (greatestPrimeNotGreaterThan)
import Test.QuickCheck

result_is_prime :: Int -> Property
result_is_prime n = n > 1 ==> isPrime (greatestPrimeNotGreaterThan n)

result_is_less_than_or_equal_to_input :: Int -> Property
result_is_less_than_or_equal_to_input n = n > 1 ==> greatestPrimeNotGreaterThan n <= n

next_largest_prime_is_larger_than_input :: Int -> Property
next_largest_prime_is_larger_than_input n = do
  let result = greatestPrimeNotGreaterThan n
  n > 1 ==> n < head (filter isPrime [result + 1, result + 2 ..])
