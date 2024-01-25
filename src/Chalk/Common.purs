module Chalk.Common
  ( Chalk
  , level
  , SupportsColor
  , mkChalk
  , withChalk
  , (&|)
  , withChalkFlipped
  , (|&)
  ) where

import Prelude
import Data.Maybe (Maybe(..))

newtype Chalk = Chalk Unit

foreign import level :: Chalk -> Int

instance Eq Chalk where
  eq c1 c2 = eq (level c1) (level c2)

instance Ord Chalk where
  compare c1 c2 = compare (level c1) (level c2)

instance Show Chalk where
  show c = "(Chalk level:" <> show (level c) <> ")"

type SupportsColor =
  { level :: Int
  , hasBasic :: Boolean
  , has256 :: Boolean
  , has16m :: Boolean
  }

foreign import _newChalk :: Int -> Chalk

mkChalk :: Int -> Maybe Chalk
mkChalk level_
  | level_ # between 0 3 = Just (_newChalk level_)
  | otherwise = Nothing

withChalk :: String -> Chalk -> String
withChalk = flip withChalkFlipped

infix 7 withChalk as &|

foreign import withChalkFlipped :: Chalk -> String -> String

infix 7 withChalkFlipped as |&
