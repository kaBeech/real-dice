module Generate (balancedTables, pseudoRandomizedInts) where

import RealDice.Convert.BinaryString (boolsToBin)
import RealDice.Generate (rawBoolFull, rawBoolPrime)
import RealDice.Manipulate (randomizeWithCustomBools)
import StdGenRandomize (randomizeList)

checkLengths :: ([Int] -> [Bool] -> [Int]) -> [Int] -> [Bool] -> [Int]
checkLengths f l1 l2 = do
  if length l1 == length l2
    then f l1 l2
    else
      error
        ( "Lengths not equal! PseudoRandomized Int List length: "
            ++ show (length l1)
            ++ " Raw Bool List length: "
            ++ show (length l2)
        )

psRndIntsPrime :: [Int]
psRndIntsPrime =
  randomizeList
    [1 .. length RealDice.Generate.rawBoolPrime]

psRndIntsFull :: [Int]
psRndIntsFull =
  randomizeList
    [1 .. length RealDice.Generate.rawBoolFull]

rdBoolsPrime :: [Bool]
rdBoolsPrime = map odd rdIntsPrime

rdBoolsFull :: [Bool]
rdBoolsFull = map odd rdIntsFull

rdIntsPrime :: [Int]
rdIntsPrime =
  checkLengths
    randomizeWithCustomBools
    psRndIntsPrime
    rawBoolPrime

rdIntsFull :: [Int]
rdIntsFull =
  checkLengths
    randomizeWithCustomBools
    psRndIntsFull
    rawBoolFull

rdBinPrime :: String
rdBinPrime = boolsToBin rdBoolsPrime

rdBinFull :: String
rdBinFull = boolsToBin rdBoolsFull

balancedTables :: String
balancedTables =
  "module RealDice.Generate.BalancedTables\n\
  \  ( rdBoolsPrime,\n\
  \    rdBoolsFull,\n\
  \    rdIntsPrime,\n\
  \    rdIntsFull,\n\
  \    rdBinPrime,\n\
  \    rdBinFull,\n\
  \  )\n\
  \where\n\
  \\n\
  \rdIntsPrime :: [Int]\n\
  \rdIntsPrime = "
    ++ show rdIntsPrime
    ++ "\n\
       \\n\
       \rdIntsFull :: [Int]\n\
       \rdIntsFull = "
    ++ show rdIntsFull
    ++ "\n\
       \\n\
       \rdBoolsPrime :: [Bool]\n\
       \rdBoolsPrime = "
    ++ show rdBoolsPrime
    ++ "\n\
       \\n\
       \rdBoolsFull :: [Bool]\n\
       \rdBoolsFull = "
    ++ show rdBoolsFull
    ++ "\n\
       \\n\
       \rdBinPrime :: String\n\
       \rdBinPrime = "
    ++ show rdBinPrime
    ++ "\n\
       \\n\
       \rdBinFull :: String\n\
       \rdBinFull = "
    ++ show rdBinFull

pseudoRandomizedInts :: String
pseudoRandomizedInts =
  "module RealDice.Generate.PseudoRandomizedInts\n\
  \  ( psRndIntsPrime,\n\
  \    psRndIntsFull\n\
  \  )\n\
  \where\n\
  \\n\
  \psRndIntsPrime :: [Int]\n\
  \psRndIntsPrime = "
    ++ show psRndIntsPrime
    ++ "\n\
       \\n\
       \psRndIntsFull :: [Int]\n\
       \psRndIntsFull = "
    ++ show psRndIntsFull
