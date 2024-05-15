module RealDice.Convert.CSV
  ( intsToCSV,
    csvToInts,
  )
where

-- | Remove the square brackets ([]) from the string representations of a list so it can be used as a CSV string.
-- For Example:
-- >>> intsToCSV [1,2,3]
-- "1,2,3"
intsToCSV :: [Int] -> String
intsToCSV xs = tail (take (length (show xs) - 1) (show xs))

-- | Add square brackets ([]) to a CSV string of integers and make it into a list. Example: "1,2,3" -> [1,2,3]
csvToInts ::
  -- | This had better be a CSV of integers...
  String ->
  -- | ...because it's gonna be parsed into a list of integers!
  [Int]
csvToInts xs = read ("[" ++ xs ++ "]")
