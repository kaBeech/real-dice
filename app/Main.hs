module Main where

import Generate qualified (balancedTables, pseudoRandomizedInts)
import RealDice.Convert.CSV qualified
import RealDice.Generate.BalancedTables qualified (rdBinFull, rdBinPrime, rdIntsFull, rdIntsPrime)
import RealDice.Generate.RawData qualified (rawBinFull, rawBinPrime)

main :: IO ()
main = do
  putStrLn "Generating src files..."
  putStrLn "Generating pseudoRandomized integers:"
  writeFile "src/RealDice/Generate/PseudoRandomizedInts.hs" Generate.pseudoRandomizedInts
  putStrLn "Generating standard RNG tables:"
  writeFile "src/RealDice/Generate/BalancedTables.hs" Generate.balancedTables
  putStrLn "Generating data files..."
  putStrLn "Generating raw binary data:"
  writeFile "generated-data/real_dice_raw_prime.bin" RealDice.Generate.RawData.rawBinPrime
  writeFile "generated-data/real_dice_raw_full.bin" RealDice.Generate.RawData.rawBinFull
  putStrLn "Generating balanced binary data:"
  writeFile "generated-data/real_dice_balanced_prime.bin" RealDice.Generate.BalancedTables.rdBinPrime
  writeFile "generated-data/real_dice_balanced_full.bin" RealDice.Generate.BalancedTables.rdBinFull
  putStrLn "Generating balanced integer data:"
  writeFile "generated-data/real_dice_balanced_integers_prime.csv" (RealDice.Convert.CSV.intsToCSV RealDice.Generate.BalancedTables.rdIntsPrime)
  writeFile "generated-data/real_dice_balanced_integers_full.csv" (RealDice.Convert.CSV.intsToCSV RealDice.Generate.BalancedTables.rdIntsFull)
  putStrLn "Files generated successfully!"
