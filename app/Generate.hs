module Generate (standardRNGTables, pseudorandomizedInts) where

import RandomizeList (randomizeListWithCustomBoolList)
import RawDataCollection (rawBoolListFullLength, rawBoolListPrimeLength)
import StdGenRandomize (randomizeList)

checkLengths :: ([Int] -> [Bool] -> [Int]) -> [Int] -> [Bool] -> [Int]
checkLengths f list1 list2 = do
  if length list1 == length list2
    then f list1 list2
    else error ("Lengths not equal! Pseudorandomized Int List length: " ++ show (length list1) ++ " Raw Bool List length: " ++ show (length list2))

pseudorandomizedIntsPrimeLength :: [Int]
pseudorandomizedIntsPrimeLength = randomizeList [1 .. length RawDataCollection.rawBoolListPrimeLength]

pseudorandomizedIntsFullLength :: [Int]
pseudorandomizedIntsFullLength = randomizeList [1 .. length RawDataCollection.rawBoolListFullLength]

standardTableBoolPrimeLength :: [Bool]
standardTableBoolPrimeLength = map odd standardTableIntPrimeLength

standardTableBoolFullLength :: [Bool]
standardTableBoolFullLength = map odd standardTableIntFullLength

standardTableIntPrimeLength :: [Int]
standardTableIntPrimeLength = checkLengths randomizeListWithCustomBoolList pseudorandomizedIntsPrimeLength rawBoolListPrimeLength

standardTableIntFullLength :: [Int]
standardTableIntFullLength = checkLengths randomizeListWithCustomBoolList pseudorandomizedIntsFullLength rawBoolListFullLength

standardRNGTables :: String
standardRNGTables =
  "module StandardRNGTables (standardTableBoolPrimeLength, standardTableBoolFullLength, standardTableIntPrimeLength, standardTableIntFullLength) where\n\
  \\n\
  \standardTableIntPrimeLength :: [Int]\n\
  \standardTableIntPrimeLength = "
    ++ show standardTableIntPrimeLength
    ++ "\n\
       \\n\
       \standardTableIntFullLength :: [Int]\n\
       \standardTableIntFullLength = "
    ++ show standardTableIntFullLength
    ++ "\n\
       \\n\
       \standardTableBoolPrimeLength :: [Bool]\n\
       \standardTableBoolPrimeLength = "
    ++ show standardTableBoolPrimeLength
    ++ "\n\
       \\n\
       \standardTableBoolFullLength :: [Bool]\n\
       \standardTableBoolFullLength = "
    ++ show standardTableBoolFullLength

pseudorandomizedInts :: String
pseudorandomizedInts =
  "module PseudorandomizedInts (pseudorandomizedIntsPrimeLength, pseudorandomizedIntsFullLength) where\n\
  \\n\
  \pseudorandomizedIntsPrimeLength :: [Int]\n\
  \pseudorandomizedIntsPrimeLength = "
    ++ show pseudorandomizedIntsPrimeLength
    ++ "\n\
       \\n\
       \pseudorandomizedIntsFullLength :: [Int]\n\
       \pseudorandomizedIntsFullLength = "
    ++ show pseudorandomizedIntsFullLength
