import {
    chalkStderr as _chalk,
    supportsColorStderr as _supportsColor
} from 'chalk';

export const chalk = function() { return _chalk; };

export const supportsColor = function() { return _supportsColor; };