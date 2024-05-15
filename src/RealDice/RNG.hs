module RealDice.RNG
  ( RDGen,
    randomIntR,
    randomFloat,
    randomDouble,
    mkRDGen,
    mkRDGenCustom,
  )
where

import RealDice.Generate.BalancedTables (rdIntsPrime)
import RealDice.Manipulate.GetValueFromRNGTable (getIntByIndex)
import RealDice.Manipulate.RandomizeList (randomizeList)

data RDGen where
  RDGen :: {index :: Int, rngTable :: [Int]} -> RDGen

mkRDGen :: Int -> RDGen
mkRDGen i = mkRDGenCustom i rdIntsPrime

mkRDGenCustom :: Int -> [Int] -> RDGen
mkRDGenCustom i [] = RDGen {index = i, rngTable = rdIntsPrime}
mkRDGenCustom i table = RDGen {index = i, rngTable = table}

randomIntR :: (Int, Int) -> RDGen -> (Int, RDGen)
randomIntR (minResult, maxResult) rng
  | minResult > maxResult = (0, rng)
  | otherwise =
      ( getIntByIndex
          (getIntByIndex (index rng) (rngTable rng))
          (randomizeList [minResult .. maxResult]),
        RDGen {index = index rng + 1, rngTable = rngTable rng}
      )

-- Returns a Float between 0 and 1
randomFloat :: Int -> RDGen -> (Float, RDGen)
randomFloat decimalPrecision rng
  | decimalPrecision < 0 = (0, rng)
  | otherwise = randomFloatSinglePass (decimalPrecision, 0) rng

randomFloatSinglePass :: (Int, Float) -> RDGen -> (Float, RDGen)
randomFloatSinglePass (0, currentFloat) rng = (currentFloat, rng)
randomFloatSinglePass (decimalPlace, currentFloat) rng = do
  let randomDigit = 
    (getIntByIndex (getIntByIndex (index rng) (rngTable rng)) (randomizeList [0 .. 9]))
  randomFloatSinglePass
    ( decimalPlace - 1,
      currentFloat + (fromIntegral randomDigit / (10 ^ decimalPlace))
    )
    (RDGen {index = index rng + 1, rngTable = rngTable rng})

-- Returns a Double between 0 and 1
randomDouble :: Int -> RDGen -> (Double, RDGen)
randomDouble decimalPrecision rng
  | decimalPrecision < 0 = (0, rng)
  | otherwise = randomDoubleSinglePass (decimalPrecision, 0) rng

randomDoubleSinglePass :: (Int, Double) -> RDGen -> (Double, RDGen)
randomDoubleSinglePass (0, currentDouble) rng = (currentDouble, rng)
randomDoubleSinglePass (decimalPlace, currentDouble) rng = do
  let randomDigit = getIntByIndex (getIntByIndex (index rng) (rngTable rng)) (randomizeList [0 .. 9])
  randomDoubleSinglePass
    ( decimalPlace - 1,
      currentDouble + (fromIntegral randomDigit / (10 ^ decimalPlace))
    )
    (RDGen {index = index rng + 1, rngTable = rngTable rng})
