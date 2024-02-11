-- | Chalk's color representations.
-- |
-- | Chalk supports three color representations: RGB, hex, and ANSI 256 colors.
-- | Foreground and background colors can be specified using one of them through
-- | [`fg`](Choku.Style#v:fg) and [`bg`](Choku.Style#v:bg) styling functions,
-- | respectively.
-- |
-- | ### See also
-- |
-- | - https://github.com/chalk/chalk#256-and-truecolor-color-support
module Choku.Color
  ( Color(..)
  , mkRGB
  , mkHex
  , mkANSI256
  ) where

import Prelude
import Control.Alternative (guard)
import Data.Maybe (Maybe)
import Data.String.Regex (test) as R
import Data.String.Regex.Flags (ignoreCase) as R
import Data.String.Regex.Unsafe (unsafeRegex) as R

data Color
  -- | RGB digits. Each channel has 8-bit range from `0` to `255`.
  = RGB { r :: Int, g :: Int, b :: Int }
  -- | Hex number representation of the RGB color model. Example: `#ED49DF`.
  | Hex String
  -- | [ANSI 256 colors](https://en.wikipedia.org/wiki/ANSI_escape_code#8-bit),
  -- | ranging from `0` to `255`.
  | ANSI256 Int

derive instance Eq Color

instance Show Color where
  show (RGB { r, g, b }) = "(RGB " <> show r <> " " <> show g <> " " <> show b <> ")"
  show (Hex hex) = "(Hex " <> hex <> ")"
  show (ANSI256 i) = "(ANSI256 " <> show i <> ")"

-- | Safe constructor to make a `Color` from RGB values.
-- |
-- | Returns `Nothing` with out-of-bounds inputs.
mkRGB :: Int -> Int -> Int -> Maybe Color
mkRGB r g b = do
  guard $ r # between 0 255
  guard $ g # between 0 255
  guard $ b # between 0 255
  pure $ RGB { r, g, b }

-- | Safe constructor to make a `Color` from Hex string.
-- |
-- | Returns `Nothing` with invalid Hex string.
-- | Prefix `#` is not mandatory.
-- | Hex digits of either length 6 (e.g., `#0a0b0c`) or 3 (e.g., `#ABC`) are accepted.
mkHex :: String -> Maybe Color
mkHex s = do
  guard $ isHexStr s
  pure $ Hex s

-- Implementation:
-- https://github.com/chalk/chalk/blob/v5.3.0/source/vendor/ansi-styles/index.js#L136
isHexStr :: String -> Boolean
isHexStr = R.test $ R.unsafeRegex "^#?([0-9a-f]{6}|[0-9a-f]{3})$" R.ignoreCase

-- | Safe constructor to make a `Color` from ANSI256 integer value between 0 and 255.
-- |
-- | Returns `Nothing` with out-of-bounds input.
mkANSI256 :: Int -> Maybe Color
mkANSI256 i = do
  guard $ i # between 0 255
  pure $ ANSI256 i
