module Test.Level0 (level0Spec) where

import Prelude (Unit, discard)
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

import Choku

level0Spec :: Spec Unit
level0Spec = describe "Chalk of level 0" do

  it "prints no colors" do
    let
      c = mkChoku HasNoColors

    ("reset" &| reset c) `shouldEqual` "reset"
    ("bold" &| bold c) `shouldEqual` "bold"
    ("dim" &| dim c) `shouldEqual` "dim"
    ("italic" &| italic c) `shouldEqual` "italic"
    ("underline" &| underline c) `shouldEqual` "underline"
    ("overline" &| overline c) `shouldEqual` "overline"
    ("inverse" &| inverse c) `shouldEqual` "inverse"
    ("hidden" &| hidden c) `shouldEqual` "hidden"
    ("strikethrough" &| strikethrough c) `shouldEqual` "strikethrough"

    ("black" &| black c) `shouldEqual` "black"
    ("red" &| red c) `shouldEqual` "red"
    ("green" &| green c) `shouldEqual` "green"
    ("yellow" &| yellow c) `shouldEqual` "yellow"
    ("blue" &| blue c) `shouldEqual` "blue"
    ("magenta" &| magenta c) `shouldEqual` "magenta"
    ("cyan" &| cyan c) `shouldEqual` "cyan"
    ("white" &| white c) `shouldEqual` "white"
    ("blackBright" &| blackBright c) `shouldEqual` "blackBright"
    ("gray" &| gray c) `shouldEqual` "gray"
    ("grey" &| grey c) `shouldEqual` "grey"
    ("redBright" &| redBright c) `shouldEqual` "redBright"
    ("greenBright" &| greenBright c) `shouldEqual` "greenBright"
    ("yellowBright" &| yellowBright c) `shouldEqual` "yellowBright"
    ("blueBright" &| blueBright c) `shouldEqual` "blueBright"
    ("magentaBright" &| magentaBright c) `shouldEqual` "magentaBright"
    ("cyanBright" &| cyanBright c) `shouldEqual` "cyanBright"
    ("whiteBright" &| whiteBright c) `shouldEqual` "whiteBright"

    ("bgBlack" &| bgBlack c) `shouldEqual` "bgBlack"
    ("bgRed" &| bgRed c) `shouldEqual` "bgRed"
    ("bgGreen" &| bgGreen c) `shouldEqual` "bgGreen"
    ("bgYellow" &| bgYellow c) `shouldEqual` "bgYellow"
    ("bgBlue" &| bgBlue c) `shouldEqual` "bgBlue"
    ("bgMagenta" &| bgMagenta c) `shouldEqual` "bgMagenta"
    ("bgCyan" &| bgCyan c) `shouldEqual` "bgCyan"
    ("bgWhite" &| bgWhite c) `shouldEqual` "bgWhite"
    ("bgBlackBright" &| bgBlackBright c) `shouldEqual` "bgBlackBright"
    ("bgGray" &| bgGray c) `shouldEqual` "bgGray"
    ("bgGrey" &| bgGrey c) `shouldEqual` "bgGrey"
    ("bgRedBright" &| bgRedBright c) `shouldEqual` "bgRedBright"
    ("bgGreenBright" &| bgGreenBright c) `shouldEqual` "bgGreenBright"
    ("bgYellowBright" &| bgYellowBright c) `shouldEqual` "bgYellowBright"
    ("bgBlueBright" &| bgBlueBright c) `shouldEqual` "bgBlueBright"
    ("bgMagentaBright" &| bgMagentaBright c) `shouldEqual` "bgMagentaBright"
    ("bgCyanBright" &| bgCyanBright c) `shouldEqual` "bgCyanBright"
    ("bgWhiteBright" &| bgWhiteBright c) `shouldEqual` "bgWhiteBright"

    ("fgRGB" &| fg (RGB { r: 1, g: 2, b: 3 }) c) `shouldEqual` "fgRGB"
    ("bgRGB" &| bg (RGB { r: 1, g: 2, b: 3 }) c) `shouldEqual` "bgRGB"
    ("fgHex" &| fg (Hex "#0A0B0C") c) `shouldEqual` "fgHex"
    ("bgHex" &| bg (Hex "#0A0B0C") c) `shouldEqual` "bgHex"
    ("fgANSI256" &| fg (ANSI256 10) c) `shouldEqual` "fgANSI256"
    ("bgANSI256" &| bg (ANSI256 10) c) `shouldEqual` "bgANSI256"
