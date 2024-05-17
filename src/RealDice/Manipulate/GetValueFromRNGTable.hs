-- \| These functions are used to get values from randomized tables for random
-- \| generation purposes

-- | This module contains functions that get values from a list
module RealDice.Manipulate.GetValueFromRNGTable
  ( getBoolByIndex,
    getIntByIndex,
  )
where

-- | Gets an integer value from a list by index, looping back to the beginning
-- | if the index is out of bounds

-- | This is used to get an element from a randomized table of integers

-- | ==== __Examples__
-- | >>> getIntByIndex 2 [1, 0, 4, 3, 2]
-- | 4
-- | >>> getIntByIndex 5 [1, 0, 4, 3, 2]
-- | 1
-- | >>> getIntByIndex -1337 [1, 0, 4,  3, 2]
-- | 3
getIntByIndex :: Int -> [Int] -> Int
getIntByIndex index l = l !! (index `mod` length l)

-- | Gets a boolean value from a list by index, looping back to the beginning
-- | if the index is out of bounds

-- | After looping over the list once, we flip the values of the elements
-- | so that we can use an odd list length while still having an even
-- | distribution of "True" and "False" values

-- | This is used to get an element from a randomized table of booleans

-- | ==== __Examples__
-- | >>> getBoolByIndex 2 [True, False, True, False, True]
-- | True
-- | >>> getBoolByIndex 5 [True, False, True, False, True]
-- | True
-- | >>> getBoolByIndex -1337 [True, False, True, False, True]
-- | False
getBoolByIndex :: Int -> [Bool] -> Bool
getBoolByIndex index l =
  if (index `mod` (length l * 2)) < length l
    then l !! (index `mod` (length l * 2))
    else not (l !! ((index `mod` (length l * 2)) - length l))
