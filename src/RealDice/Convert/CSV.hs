module RealDice.Convert.CSV
  ( intsToCSV,
    csvToInts,
  )
where

intsToCSV :: [Int] -> String
intsToCSV xs = tail (take (length (show xs) - 1) (show xs))

csvToInts :: String -> [Int]
csvToInts xs = read ("[" ++ xs ++ "]")
