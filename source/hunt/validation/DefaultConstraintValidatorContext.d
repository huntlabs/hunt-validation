/*
 * Hunt - A data validation for DLang based on hunt library.
 *
 * Copyright (C) 2015-2019, HuntLabs
 *
 * Website: https://www.huntlabs.net
 *
 * Licensed under the Apache-2.0 License.
 *
 */

module hunt.validation.DefaultConstraintValidatorContext;

import hunt.validation.ConstraintValidatorContext;
import hunt.validation.Validator;

import std.json;
import std.format;

class DefaultConstraintValidatorContext : ConstraintValidatorContext {
    private Validator[] _validators;
    private bool _isValid = true;

    override string toString() {
        return json().toString;
    }

    override string[string] messages() {
        string[string] msg;
        foreach (v; _validators) {
            if (!v.isValid) {
                msg[v.getPropertyName] = v.getMessage;
            }
        }
        return msg;
    }

    JSONValue json() {
        return JSONValue(messages());
    }

    override ConstraintValidatorContext append(Validator v) {
        _validators ~= v;
        if (!v.isValid)
            _isValid = false;
        return this;
    }

    override bool isValid() {
        return _isValid;
    }
}
