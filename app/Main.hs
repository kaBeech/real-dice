module Main where

import BinaryString qualified (binaryString)

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  putStrLn BinaryString.binaryString
