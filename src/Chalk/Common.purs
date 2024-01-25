-- | The chalk type and its common API.
module Chalk.Common
  ( Chalk
  , level
  , mkChalk
  , withChalk
  , (&|)
  , withChalkFlipped
  , (|&)
  ) where

import Prelude
import Data.Maybe (Maybe(..))

-- | The chalk type, simply wrapping a Javascript `Chalk` object.
newtype Chalk = Chalk Unit

-- | Return the color support level of the given chalk.
-- |
-- | Higher level supports more colors.
-- | For detail, see https://github.com/chalk/chalk#chalklevel.
foreign import level :: Chalk -> Int

instance Eq Chalk where
  eq c1 c2 = eq (level c1) (level c2)

instance Ord Chalk where
  compare c1 c2 = compare (level c1) (level c2)

instance Show Chalk where
  show c = ("(Chalk level:" <> show (level c) <> ")") `withChalk` c

foreign import _newChalk :: Int -> Chalk

-- | Create a new chalk with the specified level of color support.
-- |
-- | The level should be an integer bounded between `0` and `3`.
-- | Giving an out-of-bounds integer produces `Nothing`.
mkChalk :: Int -> Maybe Chalk
mkChalk level_
  | level_ # between 0 3 = Just (_newChalk level_)
  | otherwise = Nothing

-- | Modify a string with the chalk.
-- |
-- | For example,
-- |
-- | ```purescript
-- | import Prelude
-- | import Data.Maybe
-- | import Partial.Unsafe
-- | import Chalk
-- | let
-- |   chk = unsafePartial $ fromJust (mkChalk 3) # bold # cyan
-- | in
-- |   "hello" `withChalk` chk
-- | ```
-- |
-- | produces a bold cyan `"hello"` string.
withChalk :: String -> Chalk -> String
withChalk = flip withChalkFlipped

infix 7 withChalk as &|

foreign import withChalkFlipped :: Chalk -> String -> String

infix 7 withChalkFlipped as |&
