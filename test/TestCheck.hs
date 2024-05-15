module TestCheck (isPass, check) where

import Control.Monad qualified
import System.Exit
import Test.QuickCheck

isPass :: Result -> Bool
isPass (Success {}) = True
isPass _ = False

check :: (Testable prop) => prop -> IO ()
check prop = do
  result <- quickCheckResult prop
  Control.Monad.unless (isPass result) exitFailure
