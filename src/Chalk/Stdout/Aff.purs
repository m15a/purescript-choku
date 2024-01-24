module Chalk.Stdout.Aff
  ( chalk
  , withStyle
  , (&:)
  , withStyleFlipped
  , (:&)
  ) where

import Prelude
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Chalk.Stdout (chalk, withStyle, withStyleFlipped) as E
import Chalk.Types (Chalk, Style)

chalk :: Aff Chalk
chalk = liftEffect E.chalk

withStyle :: String -> Style -> Aff String
withStyle s style = liftEffect $ E.withStyle s style

infix 7 withStyle as &:

withStyleFlipped :: Style -> String -> Aff String
withStyleFlipped s style = liftEffect $ E.withStyleFlipped s style

infix 7 withStyleFlipped as :&
