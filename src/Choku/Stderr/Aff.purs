-- | `Aff` counterparts against the `Choku.Stderr` module.
module Choku.Stderr.Aff
  ( choku
  , withStyle
  , (&:)
  , withStyleFlipped
  , (:&)
  ) where

import Prelude
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Choku.Stderr (choku, withStyle, withStyleFlipped) as E
import Choku.Common (Choku)
import Choku.Style (Style)

choku :: Aff Choku
choku = liftEffect E.choku

withStyle :: String -> Style -> Aff String
withStyle s style = liftEffect $ E.withStyle s style

infix 7 withStyle as &:

withStyleFlipped :: Style -> String -> Aff String
withStyleFlipped s style = liftEffect $ E.withStyleFlipped s style

infix 7 withStyleFlipped as :&
