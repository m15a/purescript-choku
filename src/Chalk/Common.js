import { Chalk } from 'chalk';

export const _newChalk = function(level_) {
    return new Chalk({ level: level_ });
};

export const withChalkFlipped = function(chalk_) {
    return function(str) { return chalk_(str);
    };
};
