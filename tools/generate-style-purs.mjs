#!/usr/bin/env node
/*
  USAGE: ./tools/generate-style-purs.mjs > src/Chalk/Style.purs
*/

import { modifierNames, foregroundColorNames, backgroundColorNames } from 'chalk';
const stdout = process.stdout;

const allNames = modifierNames.concat(
    foregroundColorNames,
    backgroundColorNames,
    [ "fg", "bg" ]
);
stdout.write("-- | Styles of modification/colors applied to the chalk.\n");
stdout.write("-- |\n");
stdout.write("-- | These styles are basically of function `Chalk -> Chalk`, appending another\n");
stdout.write("-- | modification to the given chalk.\n");
stdout.write("-- | The full list of styles can be found [here](https://github.com/chalk/chalk#styles)\n");
stdout.write("-- | in the original README.\n");
stdout.write("-- |\n");
stdout.write("-- | An only difference from the original API is that those six methods to apply\n");
stdout.write("-- | styles using RGB/ANSI256 color models, namely `chalk.rgb`, `chalk.hex`,\n");
stdout.write("-- | `chalk.ansi256`, `chalk.bgRgb`, `chalk.bgHex`, and `chalk.bgAnsi256` are\n");
stdout.write("-- | integrated into two functions `fg` and `bg`, thanks to Purescript's GADTs.\n");
stdout.write("-- |\n");
stdout.write("-- | ### See also\n");
stdout.write("-- |\n");
stdout.write("-- | - https://github.com/chalk/chalk#chalkstylestylestring-string\n");
stdout.write("module Chalk.Style\n  ( Style\n  , ");
stdout.write(allNames.join("\n  , "));
stdout.write("\n  ) where\n\n");

stdout.write("import Data.Function.Uncurried (Fn3, runFn3)\n")
stdout.write("import Chalk.Common (Chalk)\n");
stdout.write("import Chalk.Color (Color(..))\n\n");
stdout.write("type Style = Chalk -> Chalk\n\n");

const importStyle = function(name) {
    return `foreign import ${name} :: Style\n`;
};

stdout.write("{- Modifiers -}\n\n");

for (const name of modifierNames) {
    stdout.write(importStyle(name));
}

stdout.write("\n{- Foreground colors -}\n\n");

for (const name of foregroundColorNames) {
    stdout.write(importStyle(name));
}

stdout.write("\n{- Background colors -}\n\n");

for (const name of backgroundColorNames) {
    stdout.write(importStyle(name));
}

stdout.write("\n{- 256 and Truecolor support -}\n\n");

stdout.write("foreign import _rgb :: Fn3 Int Int Int Style\n");
stdout.write("foreign import _hex :: String -> Style\n");
stdout.write("foreign import _ansi256 :: Int -> Style\n");
stdout.write("foreign import _bgRgb :: Fn3 Int Int Int Style\n");
stdout.write("foreign import _bgHex :: String -> Style\n");
stdout.write("foreign import _bgAnsi256 :: Int -> Style\n\n");

stdout.write("-- | Modify foreground color with the given color.\n");
stdout.write("fg :: Color -> Style\n");
stdout.write("fg (RGB { r, g, b }) = runFn3 _rgb r g b\n");
stdout.write("fg (Hex hex) = _hex hex\n");
stdout.write("fg (ANSI256 i) = _ansi256 i\n\n");
stdout.write("-- | Modify background color with the given color.\n");
stdout.write("bg :: Color -> Style\n");
stdout.write("bg (RGB { r, g, b }) = runFn3 _bgRgb r g b\n");
stdout.write("bg (Hex hex) = _bgHex hex\n");
stdout.write("bg (ANSI256 i) = _bgAnsi256 i\n");

// vim: tw=88 nowrap
