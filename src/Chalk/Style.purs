module Chalk.Style
  ( reset
  , bold
  , dim
  , italic
  , underline
  , overline
  , inverse
  , hidden
  , strikethrough
  , black
  , red
  , green
  , yellow
  , blue
  , magenta
  , cyan
  , white
  , blackBright
  , gray
  , grey
  , redBright
  , greenBright
  , yellowBright
  , blueBright
  , magentaBright
  , cyanBright
  , whiteBright
  , bgBlack
  , bgRed
  , bgGreen
  , bgYellow
  , bgBlue
  , bgMagenta
  , bgCyan
  , bgWhite
  , bgBlackBright
  , bgGray
  , bgGrey
  , bgRedBright
  , bgGreenBright
  , bgYellowBright
  , bgBlueBright
  , bgMagentaBright
  , bgCyanBright
  , bgWhiteBright
  , fg
  , bg
  ) where

import Chalk.Types (Color(..), Style)
import Data.Function.Uncurried (Fn3, runFn3)

{- Modifiers -}

foreign import reset :: Style
foreign import bold :: Style
foreign import dim :: Style
foreign import italic :: Style
foreign import underline :: Style
foreign import overline :: Style
foreign import inverse :: Style
foreign import hidden :: Style
foreign import strikethrough :: Style

{- Foreground colors -}

foreign import black :: Style
foreign import red :: Style
foreign import green :: Style
foreign import yellow :: Style
foreign import blue :: Style
foreign import magenta :: Style
foreign import cyan :: Style
foreign import white :: Style
foreign import blackBright :: Style
foreign import gray :: Style
foreign import grey :: Style
foreign import redBright :: Style
foreign import greenBright :: Style
foreign import yellowBright :: Style
foreign import blueBright :: Style
foreign import magentaBright :: Style
foreign import cyanBright :: Style
foreign import whiteBright :: Style

{- Background colors -}

foreign import bgBlack :: Style
foreign import bgRed :: Style
foreign import bgGreen :: Style
foreign import bgYellow :: Style
foreign import bgBlue :: Style
foreign import bgMagenta :: Style
foreign import bgCyan :: Style
foreign import bgWhite :: Style
foreign import bgBlackBright :: Style
foreign import bgGray :: Style
foreign import bgGrey :: Style
foreign import bgRedBright :: Style
foreign import bgGreenBright :: Style
foreign import bgYellowBright :: Style
foreign import bgBlueBright :: Style
foreign import bgMagentaBright :: Style
foreign import bgCyanBright :: Style
foreign import bgWhiteBright :: Style

{- 256 and Truecolor support -}

foreign import _rgb :: Fn3 Int Int Int Style
foreign import _hex :: String -> Style
foreign import _ansi256 :: Int -> Style
foreign import _bgRgb :: Fn3 Int Int Int Style
foreign import _bgHex :: String -> Style
foreign import _bgAnsi256 :: Int -> Style

fg :: Color -> Style
fg (RGB { r, g, b }) = runFn3 _rgb r g b
fg (Hex hex) = _hex hex
fg (ANSI256 i) = _ansi256 i

bg :: Color -> Style
bg (RGB { r, g, b }) = runFn3 _bgRgb r g b
bg (Hex hex) = _bgHex hex
bg (ANSI256 i) = _bgAnsi256 i
