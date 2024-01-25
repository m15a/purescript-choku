module Chalk.Color
  ( Color(..)
  ) where

import Prelude

data Color
  = RGB { r :: Int, g :: Int, b :: Int }
  | Hex String
  | ANSI256 Int

derive instance Eq Color

instance Show Color where
  show (RGB { r, g, b }) = "(RGB " <> show r <> " " <> show g <> " " <> show b <> ")"
  show (Hex hex) = "(Hex " <> hex <> ")"
  show (ANSI256 i) = "(ANSI256 " <> show i <> ")"
