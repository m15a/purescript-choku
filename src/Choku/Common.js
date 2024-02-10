import { Chalk } from 'chalk';

export const _newChalk = function(level_) {
    return new Chalk({ level: level_ });
};

export const _level = function(hasNoColors, hasBasicColors, has256Colors, has16mColors, self) {
    switch (self.level) {
        case 1:
            return hasBasicColors;
        case 2:
            return has256Colors;
        case 3:
            return has16mColors;
        // Trust that it IS 0 because it has already been validated:
        // https://github.com/chalk/chalk/blob/72c742d4716b1f94bb24bbda86d96fbb247ca646/source/index.js#L24-L32
        default:
            return hasNoColors;
    }
};

export const withChokuFlipped = function(self) {
    return function(str) { return self(str); };
};
