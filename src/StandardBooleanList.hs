module StandardBooleanList (standardBooleanList) where

import Pseudorandom qualified (pseudorandomizedIntList)

standardBooleanList :: [Bool]
standardBooleanList = map even Pseudorandom.pseudorandomizedIntList
