module RawDataCollection (rawBinaryStringFullLength, rawBinaryStringPrimeLength, rawBoolListFullLength, rawBoolListPrimeLength) where

import Prime (greatestPrimeNotGreaterThan)

-- This data is gathered from rolling dice as well as drawing poker chips out
-- of a bag, stacking them up, and using a heads/tails schema to get the
-- values

-- I'm using a string of "1"s and "0"s to represent the binary data because
-- it's easy to manually type in while I'm collecting data and it's easy to
-- parse into other data

-- How did I get binary data from the dice? Does Heads equal "1" or
-- does Tails? What do Heads and Tails mean on a poker chip anyway? Who knows?
-- I'm willfully not remembering that information between sessions of
-- collecting data, to maximize entropy =)
rawBinaryStringFullLength :: String
rawBinaryStringFullLength = "110001000001111111110101011101011100000011000011111111011000010111001101011011111101001101001101111001011010110110100010000010011001110100110000000101101001110100110101100101100011100101111011001100111100000000010001011100110110000000011001101100001011000010101111100000010101100111111010101110111111101010111011011011100101110100111010011110010110100010100110011111101101010000001000100100011110010010101001111010110011110011010011000011110110011011011101101111111010010110010101101111100110011110011011000011110111101101101111101110010011101000000001101101111011010111111010111100010110000001100000001001011010110111110000010011010001110010001101011010111011111010111111000101110000101111011001100111010100001110100111100001001010101100001011011001100100011111011010101110100111000000111111100001100101011101100000110100001110011010000101010101010100010111110011110100101010110100111001111111001100100001010100111101110011010110110110010101110111101111010110101100011111111111110111010100011111110000011011110111000101000100010010100111010110101111011"

-- We provide a subset of the full data with a prime number of elements so that
-- it's less likely that a pattern will emerge when repeatedly using a
-- predictable algorithm to loop over the data

-- For example, suppose we have this random list of 12 elements: "011010010011"
-- And suppose we repeatedly use a function that always references the
-- randomized list 4 times, each time using the element at the current
-- index and then incrementing the index by 1

-- In this scenario, the elements the function uses would start repeating
-- after running the function only three times

-- In contrast, if we use a subset of the list 11 items long ("01101001001"),
-- we can run the function 11 times before the elements start repeating
rawBinaryStringPrimeLength :: String
rawBinaryStringPrimeLength = do
  let primeLength = greatestPrimeNotGreaterThan (length rawBinaryStringFullLength)
  take primeLength rawBinaryStringFullLength

rawBoolListFullLength :: [Bool]
rawBoolListFullLength = map (== '0') rawBinaryStringFullLength

rawBoolListPrimeLength :: [Bool]
rawBoolListPrimeLength = map (== '0') rawBinaryStringPrimeLength
