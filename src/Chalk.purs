module Chalk
  ( chalk
  , chalkStderr
  , chalkOfLevel
  , supportsColor
  , supportsColorStderr
  , withChalk
  , (&/)
  , withChalkFlipped
  , (/&)
  , withStyle
  , (&@)
  , withStyleFlipped
  , (@&)
  ) where

import Prelude hiding (apply)
import Effect (Effect)
import Chalk.Types (Chalk, Style, SupportsColor)

foreign import chalk :: Effect Chalk

foreign import chalkStderr :: Effect Chalk

foreign import chalkOfLevel :: Int -> Chalk

foreign import supportsColor :: Effect SupportsColor

foreign import supportsColorStderr :: Effect SupportsColor

withChalk :: String -> Chalk -> String
withChalk = flip withChalkFlipped

infix 7 withChalk as &/

foreign import withChalkFlipped :: Chalk -> String -> String

infix 7 withChalk as /&

withStyle :: String -> Style -> Effect String
withStyle s style = do
  c <- chalk
  pure $ withChalk s (style c)

infix 7 withStyle as &@

withStyleFlipped :: Style -> String -> Effect String
withStyleFlipped = flip withStyle

infix 7 withStyleFlipped as @&
