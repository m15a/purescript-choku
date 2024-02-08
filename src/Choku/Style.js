/* Modifiers */

export const reset = function(self) { return self.reset; };
export const bold = function(self) { return self.bold; };
export const dim = function(self) { return self.dim; };
export const italic = function(self) { return self.italic; };
export const underline = function(self) { return self.underline; };
export const overline = function(self) { return self.overline; };
export const inverse = function(self) { return self.inverse; };
export const hidden = function(self) { return self.hidden; };
export const strikethrough = function(self) { return self.strikethrough; };

/* Foreground colors */

export const black = function(self) { return self.black; };
export const red = function(self) { return self.red; };
export const green = function(self) { return self.green; };
export const yellow = function(self) { return self.yellow; };
export const blue = function(self) { return self.blue; };
export const magenta = function(self) { return self.magenta; };
export const cyan = function(self) { return self.cyan; };
export const white = function(self) { return self.white; };
export const blackBright = function(self) { return self.blackBright; };
export const gray = function(self) { return self.gray; };
export const grey = function(self) { return self.grey; };
export const redBright = function(self) { return self.redBright; };
export const greenBright = function(self) { return self.greenBright; };
export const yellowBright = function(self) { return self.yellowBright; };
export const blueBright = function(self) { return self.blueBright; };
export const magentaBright = function(self) { return self.magentaBright; };
export const cyanBright = function(self) { return self.cyanBright; };
export const whiteBright = function(self) { return self.whiteBright; };

/* Background colors */

export const bgBlack = function(self) { return self.bgBlack; };
export const bgRed = function(self) { return self.bgRed; };
export const bgGreen = function(self) { return self.bgGreen; };
export const bgYellow = function(self) { return self.bgYellow; };
export const bgBlue = function(self) { return self.bgBlue; };
export const bgMagenta = function(self) { return self.bgMagenta; };
export const bgCyan = function(self) { return self.bgCyan; };
export const bgWhite = function(self) { return self.bgWhite; };
export const bgBlackBright = function(self) { return self.bgBlackBright; };
export const bgGray = function(self) { return self.bgGray; };
export const bgGrey = function(self) { return self.bgGrey; };
export const bgRedBright = function(self) { return self.bgRedBright; };
export const bgGreenBright = function(self) { return self.bgGreenBright; };
export const bgYellowBright = function(self) { return self.bgYellowBright; };
export const bgBlueBright = function(self) { return self.bgBlueBright; };
export const bgMagentaBright = function(self) { return self.bgMagentaBright; };
export const bgCyanBright = function(self) { return self.bgCyanBright; };
export const bgWhiteBright = function(self) { return self.bgWhiteBright; };

/* 256 and Truecolor support */

export const _rgb = function(r_, g_, b_) { return function(self) { return self.rgb(r_, g_, b_); }; };
export const _hex = function(hex_) { return function(self) { return self.hex(hex_); }; };
export const _ansi256 = function(i_) { return function(self) { return self.ansi256(i_); }; };
export const _bgRgb = function(r_, g_, b_) { return function(self) { return self.bgRgb(r_, g_, b_); }; };
export const _bgHex = function(hex_) { return function(self) { return self.bgHex(hex_); }; };
export const _bgAnsi256 = function(i_) { return function(self) { return self.bgAnsi256(i_); }; };
