import {
    chalkStderr as _chalk,
    supportsColorStderr as _supportsColor
} from 'chalk';

export const choku = function() { return _chalk; };

export const supportsColor = function() {
    if (_supportsColor == false) {
        return { level: 0, hasBasic: false, has256: false, has16m: false };
    }
    return _supportsColor;
};
