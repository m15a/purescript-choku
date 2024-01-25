-- | Chalk in `Effect`, for the STDERR stream.
-- |
-- | See module `Chalk.Stdout` for more information.
-- | 
-- | ### See also
-- |
-- | - https://github.com/chalk/chalk#chalkstderr-and-supportscolorstderr
module Chalk.Stderr
  ( chalk
  , supportsColor
  , withStyle
  , (&:)
  , withStyleFlipped
  , (:&)
  ) where

import Prelude
import Effect (Effect)
import Chalk.Common (Chalk, withChalk)
import Chalk.Style (Style)

-- | Get the chalk instance for STDERR, automatically detecting the level
-- | of color support.
foreign import chalk :: Effect Chalk

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

-- | Modify a string, using the chalk for STDERR, with the given style.
withStyle :: String -> Style -> Effect String
withStyle s style = do
  c <- chalk
  pure $ withChalk s (style c)

infix 7 withStyle as &:

withStyleFlipped :: Style -> String -> Effect String
withStyleFlipped = flip withStyle

infix 7 withStyleFlipped as :&
