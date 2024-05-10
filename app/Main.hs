module Main where

import BinaryString qualified (binaryString)
-- import Pseudorandom qualified (pseudorandomizedIntArray)
import StandardBooleanList qualified (standardBooleanList)

main :: IO ()
main = do
  -- print Pseudorandom.pseudorandomizedIntArray
  putStrLn "Generating data files..."
  writeFile "generated-data/raw_binary_data.dat" BinaryString.binaryString
  writeFile "generated-data/standard_boolean_list.dat" (show StandardBooleanList.standardBooleanList)
