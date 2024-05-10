module Main where

import BinaryString qualified (binaryString)
import MyLib qualified (someFunc)

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  putStrLn BinaryString.binaryString
  MyLib.someFunc
