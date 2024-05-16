module RealDice.Die (DieGen, roll1d, mkDieGen, mkDieGenCustom) where

import RealDice.Generate.BalancedTables (rdIntsPrime)
import RealDice.Manipulate.GetValueFromRNGTable (getIntByIndex)
import RealDice.Manipulate.RandomizeList (randomizeList)

-- | Stores a balanced table of random integers and an index pointing at the next value to return
data DieGen where
  DieGen :: {index :: Int, intTable :: [Int]} -> DieGen

-- | Creates a new DieGen with the given index and the default Int table
mkDieGen :: Int -> DieGen
mkDieGen i = mkDieGenCustom i rdIntsPrime

-- | Creates a new DieGen with the given index and Int table
mkDieGenCustom :: Int -> [Int] -> DieGen
mkDieGenCustom i [] = DieGen {index = i, intTable = rdIntsPrime}
mkDieGenCustom i table = DieGen {index = i, intTable = table}

-- | Generates random integer values via a simple table lookup
--   For Example:
--   >>> roll1d 20 (mkDieGen 143)
--   Returns the updated DieGen and a random integer between 1 and 20
roll1d ::
  -- | The number of sides on the die
  Int ->
  -- | The DieGen to use
  DieGen ->
  ( Int,
    -- \^ The updated index
    DieGen
  )
-- \^ The updated DieGen
roll1d n die
  | n < 1 = (0, die)
  | otherwise =
      ( getIntByIndex
          (getIntByIndex (index die) (intTable die))
          (randomizeList [1 .. n]),
        DieGen {index = index die + 1, intTable = intTable die}
      )
