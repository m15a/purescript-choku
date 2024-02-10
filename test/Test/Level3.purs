module Test.Level3 (level3Spec) where

import Prelude (Unit, discard)
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

import Choku

level3Spec :: Spec Unit
level3Spec = describe "Chalk of level 3" do

  it "prints level 3 colors" do
    let
      c = mkChoku Has16mColors

    ("reset" &| reset c) `shouldEqual` "\x1B[0mreset\x1B[0m"
    ("bold" &| bold c) `shouldEqual` "\x1B[1mbold\x1B[22m"
    ("dim" &| dim c) `shouldEqual` "\x1B[2mdim\x1B[22m"
    ("italic" &| italic c) `shouldEqual` "\x1B[3mitalic\x1B[23m"
    ("underline" &| underline c) `shouldEqual` "\x1B[4munderline\x1B[24m"
    ("overline" &| overline c) `shouldEqual` "\x1B[53moverline\x1B[55m"
    ("inverse" &| inverse c) `shouldEqual` "\x1B[7minverse\x1B[27m"
    ("hidden" &| hidden c) `shouldEqual` "\x1B[8mhidden\x1B[28m"
    ("strikethrough" &| strikethrough c) `shouldEqual` "\x1B[9mstrikethrough\x1B[29m"

    ("black" &| black c) `shouldEqual` "\x1B[30mblack\x1B[39m"
    ("red" &| red c) `shouldEqual` "\x1B[31mred\x1B[39m"
    ("green" &| green c) `shouldEqual` "\x1B[32mgreen\x1B[39m"
    ("yellow" &| yellow c) `shouldEqual` "\x1B[33myellow\x1B[39m"
    ("blue" &| blue c) `shouldEqual` "\x1B[34mblue\x1B[39m"
    ("magenta" &| magenta c) `shouldEqual` "\x1B[35mmagenta\x1B[39m"
    ("cyan" &| cyan c) `shouldEqual` "\x1B[36mcyan\x1B[39m"
    ("white" &| white c) `shouldEqual` "\x1B[37mwhite\x1B[39m"
    ("blackBright" &| blackBright c) `shouldEqual` "\x1B[90mblackBright\x1B[39m"
    ("gray" &| gray c) `shouldEqual` "\x1B[90mgray\x1B[39m"
    ("grey" &| grey c) `shouldEqual` "\x1B[90mgrey\x1B[39m"
    ("redBright" &| redBright c) `shouldEqual` "\x1B[91mredBright\x1B[39m"
    ("greenBright" &| greenBright c) `shouldEqual` "\x1B[92mgreenBright\x1B[39m"
    ("yellowBright" &| yellowBright c) `shouldEqual` "\x1B[93myellowBright\x1B[39m"
    ("blueBright" &| blueBright c) `shouldEqual` "\x1B[94mblueBright\x1B[39m"
    ("magentaBright" &| magentaBright c) `shouldEqual` "\x1B[95mmagentaBright\x1B[39m"
    ("cyanBright" &| cyanBright c) `shouldEqual` "\x1B[96mcyanBright\x1B[39m"
    ("whiteBright" &| whiteBright c) `shouldEqual` "\x1B[97mwhiteBright\x1B[39m"

    ("bgBlack" &| bgBlack c) `shouldEqual` "\x1B[40mbgBlack\x1B[49m"
    ("bgRed" &| bgRed c) `shouldEqual` "\x1B[41mbgRed\x1B[49m"
    ("bgGreen" &| bgGreen c) `shouldEqual` "\x1B[42mbgGreen\x1B[49m"
    ("bgYellow" &| bgYellow c) `shouldEqual` "\x1B[43mbgYellow\x1B[49m"
    ("bgBlue" &| bgBlue c) `shouldEqual` "\x1B[44mbgBlue\x1B[49m"
    ("bgMagenta" &| bgMagenta c) `shouldEqual` "\x1B[45mbgMagenta\x1B[49m"
    ("bgCyan" &| bgCyan c) `shouldEqual` "\x1B[46mbgCyan\x1B[49m"
    ("bgWhite" &| bgWhite c) `shouldEqual` "\x1B[47mbgWhite\x1B[49m"
    ("bgBlackBright" &| bgBlackBright c) `shouldEqual` "\x1B[100mbgBlackBright\x1B[49m"
    ("bgGray" &| bgGray c) `shouldEqual` "\x1B[100mbgGray\x1B[49m"
    ("bgGrey" &| bgGrey c) `shouldEqual` "\x1B[100mbgGrey\x1B[49m"
    ("bgRedBright" &| bgRedBright c) `shouldEqual` "\x1B[101mbgRedBright\x1B[49m"
    ("bgGreenBright" &| bgGreenBright c) `shouldEqual` "\x1B[102mbgGreenBright\x1B[49m"
    ("bgYellowBright" &| bgYellowBright c) `shouldEqual`
      "\x1B[103mbgYellowBright\x1B[49m"
    ("bgBlueBright" &| bgBlueBright c) `shouldEqual` "\x1B[104mbgBlueBright\x1B[49m"
    ("bgMagentaBright" &| bgMagentaBright c) `shouldEqual`
      "\x1B[105mbgMagentaBright\x1B[49m"
    ("bgCyanBright" &| bgCyanBright c) `shouldEqual` "\x1B[106mbgCyanBright\x1B[49m"
    ("bgWhiteBright" &| bgWhiteBright c) `shouldEqual` "\x1B[107mbgWhiteBright\x1B[49m"

    ("fgRGB" &| fg (RGB { r: 1, g: 2, b: 3 }) c) `shouldEqual`
      "\x1B[38;2;1;2;3mfgRGB\x1B[39m"
    ("bgRGB" &| bg (RGB { r: 1, g: 2, b: 3 }) c) `shouldEqual`
      "\x1B[48;2;1;2;3mbgRGB\x1B[49m"
    ("fgHex" &| fg (Hex "#0A0B0C") c) `shouldEqual` "\x1B[38;2;10;11;12mfgHex\x1B[39m"
    ("bgHex" &| bg (Hex "#0A0B0C") c) `shouldEqual` "\x1B[48;2;10;11;12mbgHex\x1B[49m"
    ("fgANSI256" &| fg (ANSI256 10) c) `shouldEqual` "\x1B[38;5;10mfgANSI256\x1B[39m"
    ("bgANSI256" &| bg (ANSI256 10) c) `shouldEqual` "\x1B[48;5;10mbgANSI256\x1B[49m"
