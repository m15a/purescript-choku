#!/usr/bin/env node
/*
  USAGE: ./tools/generate-style-purs.mjs > src/Chalk/Style.purs
*/

import { modifierNames, foregroundColorNames, backgroundColorNames } from 'chalk';
const stdout = process.stdout;

const allNames = modifierNames.concat(foregroundColorNames, backgroundColorNames);
stdout.write("module Chalk.Style\n  ( ");
stdout.write(allNames.join("\n  , "));
stdout.write("\n  ) where\n\n");

stdout.write("import Chalk.Types (Style)\n\n");

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

// vim: tw=88 nowrap
