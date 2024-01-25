-- | Chalk in `Effect`, for the STDOUT stream.
-- |
-- | The default chalk instance automatically detects the level of color support
-- | in the environment, either STDOUT or STDERR.
-- | This module provides the default chalk instance for the STDOUT stream.
-- | For the STDERR stream, use the module `Choku.Stderr`.
-- |
-- | NOTE: You can force the color support level via environment variable
-- | `$FORCE_COLOR`.
-- |
-- | ### See also
-- |
-- | - https://github.com/chalk/chalk#supportscolor
module Choku.Stdout
  ( choku
  , supportsColor
  , withStyle
  , (&:)
  , withStyleFlipped
  , (:&)
  ) where

import Prelude
import Effect (Effect)
import Choku.Common (Choku, withChoku)
import Choku.Style (Style)

-- | Get the default chalk instance for STDOUT, automatically detecting the level
-- | of color support.
foreign import choku :: Effect Choku

-- | Provide detailed information of the color support level.
-- |
-- | See https://github.com/chalk/chalk#supportscolor.
foreign import supportsColor
  :: Effect
       { level :: Int
       , hasBasic :: Boolean
       , has256 :: Boolean
       , has16m :: Boolean
       }

-- | Modify a string, using the default chalk for STDOUT, with the given style.
-- |
-- | For example,
-- |
-- | ```purescript
-- | import Prelude
-- | import Effect.Console
-- | import Data.Maybe
-- | import Partial.Unsafe
-- | import Choku
-- |
-- | log =<< "hello" `withStyle` (inverse >>> underline)
-- | ```
-- |
-- | prints an inversed and underlined `"hello"` string.
withStyle :: String -> Style -> Effect String
withStyle s style = do
  c <- choku
  pure $ withChoku s (style c)

infix 7 withStyle as &:

withStyleFlipped :: Style -> String -> Effect String
withStyleFlipped = flip withStyle

infix 7 withStyleFlipped as :&
