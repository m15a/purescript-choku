-- | Chalk in `Effect`. This module is for the STDERR stream.
-- |
-- | For more information, see the document of module `Choku.Stdout`.
-- |
-- | ### See also
-- |
-- | - https://github.com/chalk/chalk#chalkstderr-and-supportscolorstderr
module Choku.Stderr
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

-- | Get the default chalk instance for STDERR, automatically detecting the level
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

-- | Modify a string, using the default chalk for STDERR, with the given style.
withStyle :: String -> Style -> Effect String
withStyle s style = do
  c <- choku
  pure $ withChoku s (style c)

infix 7 withStyle as &:

withStyleFlipped :: Style -> String -> Effect String
withStyleFlipped = flip withStyle

infix 7 withStyleFlipped as :&
