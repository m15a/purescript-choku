#!/usr/bin/env node
/*
  USAGE: ./tools/generate-style-js.mjs > src/Choku/Style.js
*/

import { modifierNames, foregroundColorNames, backgroundColorNames } from 'chalk';
const p = function(line) { process.stdout.write(line + "\n"); }
const exportStyle = function(name) {
    return `export const ${name} = function(self) { return self.${name}; };`;
};

p("/* Modifiers */");
p("");
for (const name of modifierNames) {
    p(exportStyle(name));
}
p("");
p("/* Foreground colors */");
p("");
for (const name of foregroundColorNames) {
    p(exportStyle(name));
}
p("");
p("/* Background colors */");
p("");
for (const name of backgroundColorNames) {
    p(exportStyle(name));
}
p("");
p("/* 256 and Truecolor support */");
p("");
p("export const _rgb = function(r_, g_, b_) { return function(self) { return self.rgb(r_, g_, b_); }; };");
p("export const _hex = function(hex_) { return function(self) { return self.hex(hex_); }; };");
p("export const _ansi256 = function(i_) { return function(self) { return self.ansi256(i_); }; };");
p("export const _bgRgb = function(r_, g_, b_) { return function(self) { return self.bgRgb(r_, g_, b_); }; };");
p("export const _bgHex = function(hex_) { return function(self) { return self.bgHex(hex_); }; };");
p("export const _bgAnsi256 = function(i_) { return function(self) { return self.bgAnsi256(i_); }; };");

// vim: tw=88 nowrap
