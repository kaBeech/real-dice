module Prime (getGreatestPrimeLessThan) where

getGreatestPrimeLessThan :: Int -> Int
getGreatestPrimeLessThan n = head $ filter isPrime [n - 1, n - 2 ..]

isPrime :: Int -> Bool
isPrime n = not $ any (\x -> n `mod` x == 0) [2 .. n `div` 2]
