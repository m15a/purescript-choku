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
  ) where

import Chalk.Types (Style)

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
