-- | This module imports and re-exports some *default* submodules for convenience,
-- | namely
-- |
-- | - `Chalk.Common`
-- | - `Chalk.Color`
-- | - `Chalk.Style`
-- | - `Chalk.Stdout`
-- |
-- | The last one, `Chalk.Stdout`, might not be for your use case,
-- | as it works in `Eff` and customized for the STDOUT stream.
-- | To use chalk in `Aff`, import `Chalk.Stdout.Aff` or `Chalk.Stderr.Aff` instead.
-- | To use chalk for the STDERR stream, import `Chalk.Stderr` or `Chalk.Stderr.Aff`
-- | instead.
module Chalk
  ( module Common
  , module Color
  , module Style
  , module Stdout
  ) where

import Chalk.Common as Common
import Chalk.Color as Color
import Chalk.Style as Style
import Chalk.Stdout as Stdout
