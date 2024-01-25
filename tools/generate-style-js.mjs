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

stdout.write("\n/* 256 and Truecolor support */\n\n");

stdout.write("export const _rgb = function(r_, g_, b_) { return function(chalk_) { return chalk_.rgb(r_, g_, b_); }; };\n");
stdout.write("export const _hex = function(hex_) { return function(chalk_) { return chalk_.hex(hex_); }; };\n");
stdout.write("export const _ansi256 = function(i_) { return function(chalk_) { return chalk_.ansi256(i_); }; };\n");
stdout.write("export const _bgRgb = function(r_, g_, b_) { return function(chalk_) { return chalk_.bgRgb(r_, g_, b_); }; };\n");
stdout.write("export const _bgHex = function(hex_) { return function(chalk_) { return chalk_.bgHex(hex_); }; };\n");
stdout.write("export const _bgAnsi256 = function(i_) { return function(chalk_) { return chalk_.bgAnsi256(i_); }; };\n");

// vim: tw=88 nowrap
