import {
    default as _chalk,
    supportsColor as _supportsColor,
} from 'chalk';

export const chalk = function() { return _chalk; };

export const supportsColor = function() { return _supportsColor; };
