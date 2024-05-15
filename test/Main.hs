module Main (main) where

import Control.Monad qualified
import RealDice.CoinSpec (doesnt_give_same_result_10_times)
import RealDice.RNGSpec (returns_many_unique_numbers)
import RealDice.Util.PrimeSpec (next_largest_prime_is_larger_than_input, result_is_less_than_or_equal_to_input, result_is_prime)
import System.Exit
import Test.QuickCheck

main :: IO ()
main = do
  putStrLn "Running test suite!"
  putStrLn "Testing RealDice.Util.Prime..."
  putStrLn "...greatestPrimeNotGreaterThan..."
  putStrLn "...returns a prime result:"
  check result_is_prime
  putStrLn "...returns a result less than or equal to the input:"
  check result_is_less_than_or_equal_to_input
  putStrLn "...returns the largest possible result:"
  check next_largest_prime_is_larger_than_input
  putStrLn "Testing RealDice.CoinSpec..."
  putStrLn "..flipCoin..."
  putStrLn "...doesn't give the same result 10 times in a row:"
  check doesnt_give_same_result_10_times
  putStrLn "Testing RealDice.RNGSpec..."
  putStrLn "..randomIntR..."
  putStrLn "...returns many unique numbers:"
  check returns_many_unique_numbers
  putStrLn "All tests pass!"

isPass :: Result -> Bool
isPass (Success {}) = True
isPass _ = False

check :: (Testable prop) => prop -> IO ()
check prop = do
  result <- quickCheckResult prop
  Control.Monad.unless (isPass result) exitFailure
