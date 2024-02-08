import { Chalk } from 'chalk';

export const _newChalk = function(level_) {
    return new Chalk({ level: level_ });
};

export const level = function(self) {
    return self.level;
};

export const withChokuFlipped = function(self) {
    return function(str) { return self(str); };
};
