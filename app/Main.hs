module Main where

-- import RealDice.Generate.RawData qualified (rawBoolListFullLength, rawBoolListPrimeLength)
-- import RealDice.Generate.PseudorandomizedInts qualified (pseudorandomizedIntsFullLength, pseudorandomizedIntsPrimeLength)
-- import RealDice.Generate.StandardRNGTables qualified (standardTableBoolPrimeLength)
import Generate qualified (pseudorandomizedInts, standardRNGTables)

main :: IO ()
main = do
  -- print RealDice.Generate.PseudorandomizedInts.pseudorandomizedIntsPrimeLength
  -- print RealDice.Generate.PseudorandomizedInts.pseudorandomizedIntsFullLength
  putStrLn "Generating library src files..."
  writeFile "src/RealDice/Generate/StandardRNGTables.hs" Generate.standardRNGTables
  writeFile "src/RealDice/Generate/PseudorandomizedInts.hs" Generate.pseudorandomizedInts
  -- writeFile "generated-data/raw_binary_data_prime_length.dat" (show RealDice.Generate.RawData.rawBoolListPrimeLength)
  -- writeFile "generated-data/raw_binary_data_full_length.dat" (show RealDice.Generate.RawData.rawBoolListFullLength)
  -- writeFile "generated-data/standard_boolean_list.dat" (show RealDice.Generate.StandardRNGTables.standardTableBoolPrimeLength)
  putStrLn "Files generatd successfully!"
