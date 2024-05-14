module GetValueFromRNGTable (getBoolByIndex, getIntByIndex) where

getIntByIndex :: Int -> [Int] -> Int
getIntByIndex index list = list !! index `mod` length list

-- After looping over the list once, we flip the values of the elements
-- so that we can use an odd list length while still having an even
-- distribution of "True" and "False" values
getBoolByIndex :: Int -> [Bool] -> Bool
getBoolByIndex index list = do
  let doubleLength = length list * 2
  let index' = index `mod` doubleLength
  if index' < length list
    then list !! index'
    else not (list !! (index' - length list))
