module Main where

-- import Pseudorandom qualified (pseudorandomizedIntListFullLength, pseudorandomizedIntListPrimeLength)
import RawDataCollection qualified (rawBinaryStringFullLength, rawBinaryStringPrimeLength)

-- import StandardBooleanList qualified (standardBooleanList)

main :: IO ()
main = do
  -- print Pseudorandom.pseudorandomizedIntListPrimeLength
  -- print Pseudorandom.pseudorandomizedIntListFullLength
  putStrLn "Generating data files..."
  writeFile "generated-data/raw_binary_data_full_length.dat" RawDataCollection.rawBinaryStringFullLength
  writeFile "generated-data/raw_binary_data_prime_length.dat" RawDataCollection.rawBinaryStringPrimeLength

-- writeFile "generated-data/standard_boolean_list.dat" (show StandardBooleanList.standardBooleanList)
