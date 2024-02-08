-- | The `Choku` type and its common interface.
module Choku.Common
  ( Choku
  , level
  , mkChoku
  , withChoku
  , (&|)
  , withChokuFlipped
  , (|&)
  ) where

import Prelude
import Data.Maybe (Maybe(..))

-- | The `Choku` type, simply wrapping a `Chalk` instance in the Javascript layer.
foreign import data Choku :: Type

-- | Return the color support level of the given chalk.
-- |
-- | Higher level means more colors are supported.
-- | For detail, see https://github.com/chalk/chalk#chalklevel.
foreign import level :: Choku -> Int

instance Eq Choku where
  eq c1 c2 = eq (level c1) (level c2)

instance Ord Choku where
  compare c1 c2 = compare (level c1) (level c2)

instance Show Choku where
  show c = ("(Choku level:" <> show (level c) <> ")") `withChoku` c

foreign import _newChalk :: Int -> Choku

-- | Create a new chalk instance with the specified level of color support.
-- |
-- | The level should be an integer bounded between `0` and `3`.
-- | An out-of-bounds integer produces `Nothing`.
mkChoku :: Int -> Maybe Choku
mkChoku level_
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
-- | import Choku
-- | let
-- |   chk = unsafePartial $ fromJust (mkChoku 3) # bold # cyan
-- | in
-- |   "hello" `withChoku` chk
-- | ```
-- |
-- | produces a bold cyan `"hello"` string.
withChoku :: String -> Choku -> String
withChoku = flip withChokuFlipped

infix 7 withChoku as &|

foreign import withChokuFlipped :: Choku -> String -> String

infix 7 withChokuFlipped as |&
