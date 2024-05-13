module Generate (standardRNGTables, pseudorandomizedInts) where

import RandomizeList (randomizeListWithCustomBoolList)
import RawDataCollection (rawBoolListFullLength, rawBoolListPrimeLength)
import StdGenRandomize (randomizeList)

pseudorandomizedIntsPrimeLength :: [Int]
pseudorandomizedIntsPrimeLength = randomizeList [1 .. length RawDataCollection.rawBoolListPrimeLength]

pseudorandomizedIntsFullLength :: [Int]
pseudorandomizedIntsFullLength = randomizeList [1 .. length RawDataCollection.rawBoolListFullLength]

standardTableBoolPrimeLength :: [Bool]
standardTableBoolPrimeLength = map odd standardTableIntPrimeLength

standardTableBoolFullLength :: [Bool]
standardTableBoolFullLength = map odd standardTableIntFullLength

standardTableIntPrimeLength :: [Int]
standardTableIntPrimeLength = randomizeListWithCustomBoolList pseudorandomizedIntsPrimeLength rawBoolListPrimeLength

standardTableIntFullLength :: [Int]
standardTableIntFullLength = randomizeListWithCustomBoolList pseudorandomizedIntsFullLength rawBoolListFullLength

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
