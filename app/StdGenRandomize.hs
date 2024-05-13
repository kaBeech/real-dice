module StdGenRandomize (randomizeList) where

import Control.Monad.State
import System.Random (StdGen, mkStdGen, randomR)

data RandomState where
  RandomState :: {generator :: StdGen} -> RandomState

randomizeList :: [Int] -> [Int]
randomizeList elements = evalState (randomizeListSinglePass elements []) (RandomState (mkStdGen 143))

randomizeListSinglePass :: [Int] -> [Int] -> State RandomState [Int]
randomizeListSinglePass [] list' = return list'
randomizeListSinglePass list list' = do
  random <- get
  let gen = generator random
  let (randomIndex, gen') = randomR (0, length list - 1) gen
  let element = list !! randomIndex
  put RandomState {generator = gen'}
  randomizeListSinglePass (filter (/= element) list) (element : list')
