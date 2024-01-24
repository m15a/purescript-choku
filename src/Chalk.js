import {
    Chalk,
    default as _chalk,
    chalkStderr as _chalkStderr,
    supportsColor as _supportsColor,
    supportsColorStderr as _supportsColorStderr
} from 'chalk';

export const chalk = function() {
    return _chalk;
};

export const chalkStderr = function() {
    return _chalkStderr;
};

export const chalkOfLevel = function(level_) {
    return new Chalk({ level: level_ });
};

export const supportsColor = function() {
    return _supportsColor;
};

export const supportsColorStderr = function() {
    return _supportsColorStderr;
};

export const withChalkFlipped = function(chalk_) {
    return function(str) { return chalk_(str);
    };
};
