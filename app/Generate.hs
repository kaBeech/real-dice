module Generate (standardRNGTables) where

import Pseudorandom (pseudorandomizedIntListFullLength, pseudorandomizedIntListPrimeLength)
import RandomizeList (randomizeListWithCustomBoolList)
import RawDataCollection (rawBoolListFullLength, rawBoolListPrimeLength)

standardTableBoolPrimeLength :: [Bool]
standardTableBoolPrimeLength = map odd standardTableIntPrimeLength

standardTableBoolFullLength :: [Bool]
standardTableBoolFullLength = map odd standardTableIntFullLength

standardTableIntPrimeLength :: [Int]
standardTableIntPrimeLength = randomizeListWithCustomBoolList pseudorandomizedIntListPrimeLength rawBoolListPrimeLength

standardTableIntFullLength :: [Int]
standardTableIntFullLength = randomizeListWithCustomBoolList pseudorandomizedIntListFullLength rawBoolListFullLength

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
    ++ "\n\
       \"
