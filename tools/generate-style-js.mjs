#!/usr/bin/env node
/*
  USAGE: ./tools/generate-style-js.mjs > src/Chalk/Style.js
*/

import { modifierNames, foregroundColorNames, backgroundColorNames } from 'chalk';
const stdout = process.stdout;

const exportStyle = function(name) {
    return `export const ${name} = function(chalk_) { return chalk_.${name}; };\n`;
};

stdout.write("/* Modifiers */\n\n");

for (const name of modifierNames) {
    stdout.write(exportStyle(name));
}

stdout.write("\n/* Foreground colors */\n\n");

for (const name of foregroundColorNames) {
    stdout.write(exportStyle(name));
}

stdout.write("\n/* Background colors */\n\n");

for (const name of backgroundColorNames) {
    stdout.write(exportStyle(name));
}

// vim: tw=88 nowrap
