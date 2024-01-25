#!/usr/bin/env node
/*
  USAGE: ./tools/generate-style-purs.mjs > src/Choku/Style.purs
*/

import { modifierNames, foregroundColorNames, backgroundColorNames } from 'chalk';
const p_ = function(line) { process.stdout.write(line); }
const p = function(line) { process.stdout.write(line + "\n"); }
const allNames = modifierNames.concat(
    foregroundColorNames,
    backgroundColorNames,
    [ "fg", "bg" ]
);
const importStyle = function(name) {
    return `foreign import ${name} :: Style`;
};

p("-- | Styles applied to chalks for modifying/colorizing strings.");
p("-- |");
p("-- | These styles are of signature `Choku -> Choku`, appending another");
p("-- | modification to any chalk.");
p("-- | The full list of styles can be found [here](https://github.com/chalk/chalk#styles)");
p("-- | in the original chalk's README.");
p("-- |");
p("-- | An only difference from the original API is that those six methods to apply");
p("-- | styles using RGB/ANSI256 color models, namely `chalk.rgb()`, `chalk.hex()`,");
p("-- | `chalk.ansi256()`, `chalk.bgRgb()`, `chalk.bgHex()`, and `chalk.bgAnsi256()` are");
p("-- | integrated into two functions `fg` and `bg`, thanks to Purescript's GADTs.");
p("-- |");
p("-- | ### See also");
p("-- |");
p("-- | - https://github.com/chalk/chalk#chalkstylestylestring-string");
p("module Choku.Style");
p("  ( Style");
p_("  , ");
p(allNames.join("\n  , "));
p("  ) where");
p("");
p("import Data.Function.Uncurried (Fn3, runFn3)")
p("import Choku.Common (Choku)");
p("import Choku.Color (Color(..))");
p("");
p("type Style = Choku -> Choku");
p("");
p("{- Modifiers -}");
p("")
for (const name of modifierNames) {
    p(importStyle(name));
}
p("")
p("{- Foreground colors -}");
p("")
for (const name of foregroundColorNames) {
    p(importStyle(name));
}
p("")
p("{- Background colors -}");
p("")
for (const name of backgroundColorNames) {
    p(importStyle(name));
}
p("")
p("{- 256 and Truecolor support -}");
p("")
p("foreign import _rgb :: Fn3 Int Int Int Style");
p("foreign import _hex :: String -> Style");
p("foreign import _ansi256 :: Int -> Style");
p("foreign import _bgRgb :: Fn3 Int Int Int Style");
p("foreign import _bgHex :: String -> Style");
p("foreign import _bgAnsi256 :: Int -> Style");
p("")
p("-- | Modify foreground color.");
p("fg :: Color -> Style");
p("fg (RGB { r, g, b }) = runFn3 _rgb r g b");
p("fg (Hex hex) = _hex hex");
p("fg (ANSI256 i) = _ansi256 i");
p("")
p("-- | Modify background color.");
p("bg :: Color -> Style");
p("bg (RGB { r, g, b }) = runFn3 _bgRgb r g b");
p("bg (Hex hex) = _bgHex hex");
p("bg (ANSI256 i) = _bgAnsi256 i");

// vim: tw=88 nowrap
