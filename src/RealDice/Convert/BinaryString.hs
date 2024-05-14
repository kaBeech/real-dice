module RealDice.Convert.BinaryString (fromBoolToBinaryChar, fromBoolListToBinaryString, fromBinaryCharToBool, fromBinaryStringToBoolList) where

fromBoolToBinaryChar :: Bool -> Char
fromBoolToBinaryChar False = '0'
fromBoolToBinaryChar True = '1'

fromBoolListToBinaryString :: [Bool] -> String
fromBoolListToBinaryString = map fromBoolToBinaryChar

fromBinaryCharToBool :: Char -> Bool
fromBinaryCharToBool '0' = False
fromBinaryCharToBool '1' = True
fromBinaryCharToBool x = do
  let errorMessage = "Invalid binary character: '" ++ [x] ++ "' (valid binary characters are '0' and '1')"
  error errorMessage

fromBinaryStringToBoolList :: String -> [Bool]
fromBinaryStringToBoolList = map fromBinaryCharToBool
