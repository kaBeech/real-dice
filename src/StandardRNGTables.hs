module StandardRNGTables (standardTableBoolPrimeLength, standardTableBoolFullLength) where

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
