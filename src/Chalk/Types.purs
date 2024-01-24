module Chalk.Types
  ( Chalk
  , Style
  , SupportsColor
  ) where

import Prelude (Unit)

newtype Chalk = Chalk Unit

type Style = Chalk -> Chalk

type SupportsColor =
  { level :: Int
  , hasBasic :: Boolean
  , has256 :: Boolean
  , has16m :: Boolean
  }
