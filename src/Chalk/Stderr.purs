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
import Chalk.Common (Chalk, SupportsColor, withChalk)
import Chalk.Style (Style)

foreign import chalk :: Effect Chalk

foreign import supportsColor :: Effect SupportsColor

withStyle :: String -> Style -> Effect String
withStyle s style = do
  c <- chalk
  pure $ withChalk s (style c)

infix 7 withStyle as &:

withStyleFlipped :: Style -> String -> Effect String
withStyleFlipped = flip withStyle

infix 7 withStyleFlipped as :&
