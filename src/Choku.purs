-- | This module imports and re-exports some *default* submodules for convenience,
-- | namely
-- |
-- | - `Choku.Common`
-- | - `Choku.Color`
-- | - `Choku.Style`
-- | - `Choku.Stdout`
-- |
-- | The last one, `Choku.Stdout`, might not be for your use case,
-- | as it works in `Eff` and customized for the STDOUT stream.
-- | To use chalk in `Aff`, import `Choku.Stdout.Aff` or `Choku.Stderr.Aff` instead.
-- | To use chalk for the STDERR stream, import `Choku.Stderr` or `Choku.Stderr.Aff`
-- | instead.
module Choku
  ( module Common
  , module Color
  , module Style
  , module Stdout
  ) where

import Choku.Common as Common
import Choku.Color as Color
import Choku.Style as Style
import Choku.Stdout as Stdout
