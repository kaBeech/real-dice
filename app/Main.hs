module Main where

import BinaryString qualified (binaryString)

main :: IO ()
main = do
  putStrLn "Generating data files..."
  writeFile "generated-data/raw_binary_data.dat" BinaryString.binaryString
