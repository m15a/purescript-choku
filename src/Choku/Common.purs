-- | The `Choku` type and its common interface.
module Choku.Common
  ( Choku
  , ColorSupportLevel(..)
  , level
  , mkChoku
  , withChoku
  , (&|)
  , withChokuFlipped
  , (|&)
  ) where

import Prelude
import Data.Function.Uncurried (Fn5, runFn5)

-- | The `Choku` type, simply wrapping a `Chalk` instance in the Javascript layer.
foreign import data Choku :: Type

foreign import _level
  :: Fn5
       ColorSupportLevel
       ColorSupportLevel
       ColorSupportLevel
       ColorSupportLevel
       Choku
       ColorSupportLevel

-- | Return the color support level of the given chalk.
level :: Choku -> ColorSupportLevel
level = runFn5 _level HasNoColors HasBasicColors Has256Colors Has16mColors

instance Eq Choku where
  eq c1 c2 = eq (level c1) (level c2)

instance Ord Choku where
  compare c1 c2 = compare (level c1) (level c2)

instance Show Choku where
  show c = ("(Choku level:" <> show (level c) <> ")") `withChoku` c

-- | Level of color support.
-- |
-- |     | Level            | Int | Description                           |
-- |     | ---------------- | --- | ------------------------------------- |
-- |     | `HasNoColors`    |   0 | All colors disabled                   |
-- |     | `HasBasicColors` |   1 | Basic color support (16 colors)       |
-- |     | `Has256Colors`   |   2 | 256 color support                     |
-- |     | `Has16mColors`   |   3 | Truecolor support (16 million colors) |
-- |
-- | See also https://github.com/chalk/chalk#chalklevel.
data ColorSupportLevel
  = HasNoColors
  | HasBasicColors
  | Has256Colors
  | Has16mColors

colorSupportLevelInt :: ColorSupportLevel -> Int
colorSupportLevelInt = case _ of
  HasNoColors -> 0
  HasBasicColors -> 1
  Has256Colors -> 2
  Has16mColors -> 3

derive instance Eq ColorSupportLevel

instance Ord ColorSupportLevel where
  compare x y = compare (colorSupportLevelInt x) (colorSupportLevelInt y)

instance Show ColorSupportLevel where
  show HasNoColors = "HasNoColors"
  show HasBasicColors = "HasBasicColors"
  show Has256Colors = "Has256Colors"
  show Has16mColors = "Has16mColors"

foreign import _newChalk :: Int -> Choku

-- | Create a new chalk instance with the specified level of color support.
mkChoku :: ColorSupportLevel -> Choku
mkChoku = _newChalk <<< colorSupportLevelInt

-- | Modify a string with the chalk.
-- |
-- | For example,
-- |
-- | ```purescript
-- | import Prelude
-- | import Choku
-- |
-- | let
-- |   chalk = mkChoku Has16mColor # bold # cyan
-- | in
-- |   "hello" `withChoku` chalk
-- | ```
-- |
-- | produces a bold cyan `"hello"` string.
withChoku :: String -> Choku -> String
withChoku = flip withChokuFlipped

infix 7 withChoku as &|

foreign import withChokuFlipped :: Choku -> String -> String

infix 7 withChokuFlipped as |&
