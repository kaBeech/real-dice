module Main where

import BinaryString qualified (binaryStringFullLength, binaryStringPrimeLength)

-- import Pseudorandom qualified (pseudorandomizedIntArray)
-- import StandardBooleanList qualified (standardBooleanList)

main :: IO ()
main = do
  -- print Pseudorandom.pseudorandomizedIntArray
  putStrLn "Generating data files..."
  writeFile "generated-data/raw_binary_data_full_length.dat" BinaryString.binaryStringFullLength
  writeFile "generated-data/raw_binary_data_prime_length.dat" BinaryString.binaryStringPrimeLength

-- writeFile "generated-data/standard_boolean_list.dat" (show StandardBooleanList.standardBooleanList)
