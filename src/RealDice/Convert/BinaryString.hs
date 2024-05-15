module RealDice.Convert.BinaryString
  ( boolToBin,
    boolsToBin,
    binToBool,
    binToBools,
    stringToBools,
  )
where

boolToBin :: Bool -> Char
boolToBin False = '0'
boolToBin True = '1'

boolsToBin :: [Bool] -> String
boolsToBin = map boolToBin

binToBool :: Char -> Bool
binToBool '0' = False
binToBool '1' = True
binToBool x =
  error
    ( "Invalid binary character: '"
        ++ [x]
        ++ "' (valid binary characters are '0' and '1')"
    )

binToBools :: String -> [Bool]
binToBools = map binToBool

stringToBools :: String -> [Bool]
stringToBools = acc []
  where
    acc :: [Bool] -> String -> [Bool]
    acc boolList [] = boolList
    acc boolList ('0' : xs) = acc (False : boolList) xs
    acc boolList ('1' : xs) = acc (True : boolList) xs
    acc boolList (_ : xs) = acc boolList xs
