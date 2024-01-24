module Chalk.Common
  ( mkChalk
  , withChalk
  , (&|)
  , withChalkFlipped
  , (|&)
  ) where

import Prelude
import Data.Maybe (Maybe(..))
import Chalk.Types (Chalk)

foreign import _newChalk :: Int -> Chalk

mkChalk :: Int -> Maybe Chalk
mkChalk level
  | level # between 0 3 = Just (_newChalk level)
  | otherwise = Nothing

withChalk :: String -> Chalk -> String
withChalk = flip withChalkFlipped

infix 7 withChalk as &|

foreign import withChalkFlipped :: Chalk -> String -> String

infix 7 withChalkFlipped as |&
