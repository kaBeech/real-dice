module RealDice.Manipulate.GetValueFromRNGTable
  ( getBoolByIndex,
    getIntByIndex,
  )
where

getIntByIndex :: Int -> [Int] -> Int
getIntByIndex index l = l !! (index `mod` length l)

-- After looping over the list once, we flip the values of the elements
-- so that we can use an odd list length while still having an even
-- distribution of "True" and "False" values
getBoolByIndex :: Int -> [Bool] -> Bool
getBoolByIndex index l =
  if (index `mod` (length l * 2)) < length l
    then l !! (index `mod` (length l * 2))
    else not (l !! ((index `mod` (length l * 2)) - length l))
