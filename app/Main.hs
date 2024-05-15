module Main where

import Generate qualified (pseudorandomizedInts, standardRNGTables)
import RealDice.Generate.RawData qualified (rawBinFull, rawBinPrime)
import RealDice.Generate.StandardRNGTables qualified (rdBinFull, rdBinPrime, standardTableIntFullLength, standardTableIntPrimeLength)

main :: IO ()
main = do
  putStrLn "Generating src files..."
  putStrLn "Generating pseudorandomized integers:"
  writeFile "src/RealDice/Generate/PseudorandomizedInts.hs" Generate.pseudorandomizedInts
  putStrLn "Generating standard RNG tables:"
  writeFile "src/RealDice/Generate/StandardRNGTables.hs" Generate.standardRNGTables
  putStrLn "Generating data files..."
  putStrLn "Generating raw binary data:"
  writeFile "generated-data/real_dice_raw_binary_prime.dat" (show RealDice.Generate.RawData.rawBinPrime)
  writeFile "generated-data/real_dice_raw_binary_full.dat" (show RealDice.Generate.RawData.rawBinFull)
  putStrLn "Generating balanced binary data:"
  writeFile "generated-data/real_dice_balanced_binary_prime.dat" (show RealDice.Generate.StandardRNGTables.rdBinPrime)
  writeFile "generated-data/real_dice_balanced_binary_full.dat" (show RealDice.Generate.StandardRNGTables.rdBinFull)
  putStrLn "Generating balanced integer data:"
  writeFile "generated-data/real_dice_balanced_integers_prime.dat" (show RealDice.Generate.StandardRNGTables.standardTableIntPrimeLength)
  writeFile "generated-data/real_dice_balanced_integers_full.dat" (show RealDice.Generate.StandardRNGTables.standardTableIntFullLength)
  putStrLn "Files generatd successfully!"
