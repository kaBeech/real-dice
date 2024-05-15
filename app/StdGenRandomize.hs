module StdGenRandomize (randomizeList) where

import Control.Monad.State
import System.Random (StdGen, mkStdGen, randomR)

data RandomState where
  RandomState :: {generator :: StdGen} -> RandomState

randomizeList :: [Int] -> [Int]
randomizeList xs = evalState (randomizeListSinglePass xs []) (RandomState (mkStdGen 143))

randomizeListSinglePass :: [Int] -> [Int] -> State RandomState [Int]
randomizeListSinglePass [] l' = return l'
randomizeListSinglePass l l' = do
  random <- get
  let (randomIndex, gen') = randomR (0, length l - 1) (generator random)
  let x = l !! randomIndex
  put RandomState {generator = gen'}
  randomizeListSinglePass (filter (/= x) l) (x : l')
