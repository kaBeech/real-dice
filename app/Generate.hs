module Generate (standardRNGTables, pseudorandomizedInts) where

import RealDice.Generate (rawBoolListFullLength, rawBoolListPrimeLength)
import RealDice.Manipulate (randomizeListWithCustomBoolList)
import StdGenRandomize (randomizeList)

checkLengths :: ([Int] -> [Bool] -> [Int]) -> [Int] -> [Bool] -> [Int]
checkLengths f list1 list2 = do
  if length list1 == length list2
    then f list1 list2
    else
      error
        ( "Lengths not equal! Pseudorandomized Int List length: "
            ++ show (length list1)
            ++ " Raw Bool List length: "
            ++ show (length list2)
        )

pseudorandomizedIntsPrimeLength :: [Int]
pseudorandomizedIntsPrimeLength =
  randomizeList
    [1 .. length RealDice.Generate.rawBoolListPrimeLength]

pseudorandomizedIntsFullLength :: [Int]
pseudorandomizedIntsFullLength =
  randomizeList
    [1 .. length RealDice.Generate.rawBoolListFullLength]

standardTableBoolPrimeLength :: [Bool]
standardTableBoolPrimeLength = map odd standardTableIntPrimeLength

standardTableBoolFullLength :: [Bool]
standardTableBoolFullLength = map odd standardTableIntFullLength

standardTableIntPrimeLength :: [Int]
standardTableIntPrimeLength =
  checkLengths
    randomizeListWithCustomBoolList
    pseudorandomizedIntsPrimeLength
    rawBoolListPrimeLength

standardTableIntFullLength :: [Int]
standardTableIntFullLength =
  checkLengths
    randomizeListWithCustomBoolList
    pseudorandomizedIntsFullLength
    rawBoolListFullLength

standardRNGTables :: String
standardRNGTables =
  "module RealDice.Generate.StandardRNGTables\n\
  \  ( standardTableBoolPrimeLength,\n\
  \    standardTableBoolFullLength,\n\
  \    standardTableIntPrimeLength,\n\
  \    standardTableIntFullLength\n\
  \  )\n\
  \where\n\
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
  "module RealDice.Generate.PseudorandomizedInts\n\
  \  ( pseudorandomizedIntsPrimeLength,\n\
  \    pseudorandomizedIntsFullLength\n\
  \  )\n\
  \where\n\
  \\n\
  \pseudorandomizedIntsPrimeLength :: [Int]\n\
  \pseudorandomizedIntsPrimeLength = "
    ++ show pseudorandomizedIntsPrimeLength
    ++ "\n\
       \\n\
       \pseudorandomizedIntsFullLength :: [Int]\n\
       \pseudorandomizedIntsFullLength = "
    ++ show pseudorandomizedIntsFullLength
