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
  ) where

import Prelude

data Color
  -- | RGB digits. Each channel has the 8-bit range `0` to `255`.
  = RGB { r :: Int, g :: Int, b :: Int }
  -- | Hex number representation of the RGB color model, for example `#ED49DF`.
  | Hex String
  -- | [ANSI 256 colors](https://en.wikipedia.org/wiki/ANSI_escape_code#8-bit),
  -- | ranging from `0` to `255`.
  | ANSI256 Int

derive instance Eq Color

instance Show Color where
  show (RGB { r, g, b }) = "(RGB " <> show r <> " " <> show g <> " " <> show b <> ")"
  show (Hex hex) = "(Hex " <> hex <> ")"
  show (ANSI256 i) = "(ANSI256 " <> show i <> ")"
