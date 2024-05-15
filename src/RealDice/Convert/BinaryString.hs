module RealDice.Convert.BinaryString
  ( fromBoolToBinaryChar,
    fromBoolListToBinaryString,
    fromBinaryCharToBool,
    fromBinaryStringToBoolList,
    fromMixedStringToBoolList,
  )
where

fromBoolToBinaryChar :: Bool -> Char
fromBoolToBinaryChar False = '0'
fromBoolToBinaryChar True = '1'

fromBoolListToBinaryString :: [Bool] -> String
fromBoolListToBinaryString = map fromBoolToBinaryChar

fromBinaryCharToBool :: Char -> Bool
fromBinaryCharToBool '0' = False
fromBinaryCharToBool '1' = True
fromBinaryCharToBool x =
  error
    ( "Invalid binary character: '"
        ++ [x]
        ++ "' (valid binary characters are '0' and '1')"
    )

fromBinaryStringToBoolList :: String -> [Bool]
fromBinaryStringToBoolList = map fromBinaryCharToBool

fromMixedStringToBoolList :: String -> [Bool]
fromMixedStringToBoolList = acc []
  where
    acc :: [Bool] -> String -> [Bool]
    acc boolList [] = boolList
    acc boolList ('0' : xs) = acc (False : boolList) xs
    acc boolList ('1' : xs) = acc (True : boolList) xs
    acc boolList (_ : xs) = acc boolList xs
