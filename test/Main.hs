module Main (main) where

import Control.Monad qualified
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
  putStrLn "All tests pass!"

isPass :: Result -> Bool
isPass (Success {}) = True
isPass _ = False

check :: (Testable prop) => prop -> IO ()
check prop = do
  result <- quickCheckResult prop
  Control.Monad.unless (isPass result) exitFailure
