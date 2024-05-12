module Prime (greatestPrimeNotGreaterThan, isPrime) where

greatestPrimeNotGreaterThan :: Int -> Int
greatestPrimeNotGreaterThan n = head $ filter isPrime [n, n - 1 ..]

isPrime :: Int -> Bool
isPrime n = not $ any (\x -> n `mod` x == 0) [2 .. n `div` 2]
