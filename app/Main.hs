module Main where

import Generate (balancedTables, pseudoRandomizedInts)
import RealDice.Convert.CSV (intsToCSV)
import RealDice.Generate.BalancedTables
  ( rdBinFull,
    rdBinPrime,
    rdIntsFull,
    rdIntsPrime,
  )
import RealDice.Generate.RawData (rawBinFull, rawBinPrime)

main :: IO ()
main = do
  putStrLn "Generating src files..."
  putStrLn "Generating pseudoRandomized integers:"
  writeFile
    "src/RealDice/Generate/PseudoRandomizedInts.hs"
    pseudoRandomizedInts
  putStrLn "Generating standard RNG tables:"
  writeFile "src/RealDice/Generate/BalancedTables.hs" balancedTables
  putStrLn "Generating data files..."
  putStrLn "Generating raw binary data:"
  writeFile "generated-data/real_dice_raw_prime.bin" rawBinPrime
  writeFile "generated-data/real_dice_raw_full.bin" rawBinFull
  putStrLn "Generating balanced binary data:"
  writeFile "generated-data/real_dice_balanced_prime.bin" rdBinPrime
  writeFile "generated-data/real_dice_balanced_full.bin" rdBinFull
  putStrLn "Generating balanced integer data:"
  writeFile
    "generated-data/real_dice_balanced_integers_prime.csv"
    (intsToCSV rdIntsPrime)
  writeFile
    "generated-data/real_dice_balanced_integers_full.csv"
    (intsToCSV rdIntsFull)
  putStrLn "Files generated successfully!"
