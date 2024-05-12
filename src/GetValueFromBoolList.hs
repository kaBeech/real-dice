module GetValueFromBoolList (getValueByIndex) where

-- After looping over the list once, we flip the values of the elements
-- so that we can use an odd list length while still having an even
-- distribution of "True" and "False" values
getValueByIndex :: Int -> [Bool] -> Bool
getValueByIndex index list = do
  let doubleLength = length list * 2
  let index' = index `mod` doubleLength
  if index' < length list
    then list !! index'
    else not (list !! (index' - length list))
