module Main where

import BinaryString qualified (binaryString)
-- import Pseudorandom qualified (pseudorandomizedIntArray)

main :: IO ()
main = do
  -- print Pseudorandom.pseudorandomizedIntArray
  putStrLn "Generating data files..."
  writeFile "generated-data/raw_binary_data.dat" BinaryString.binaryString
