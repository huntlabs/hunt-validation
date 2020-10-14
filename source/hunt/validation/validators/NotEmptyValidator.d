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
module hunt.validation.validators.NotEmptyValidator;

import hunt.validation.constraints.NotEmpty;
import hunt.validation.ConstraintValidator;
import hunt.validation.ConstraintValidatorContext;
import hunt.validation.Validator;

import std.string;
import std.traits;

class NotEmptyValidator(T) : AbstractValidator , ConstraintValidator!(NotEmpty, T) {

    private NotEmpty _notempty;

    override void initialize(NotEmpty constraintAnnotation){
        _notempty = constraintAnnotation;
    }
    
    override
    public bool isValid(T data, ConstraintValidatorContext constraintValidatorContext) {
        scope(exit) constraintValidatorContext.append(this);
        
        static if(is(T == class)) {
            if(data is null)
            {
                _isValid = false;
                return false;
            }
        }

        static if(isArray!(T) || isAssociativeArray!(T) || is(T == string))
        {    
            _isValid = data.strip().length > 0;
            return _isValid;
        } else static if(is(T == class)) {
            if(data is null)
            {
                _isValid = false;
                return false;
            }
        }
        else 
        {
            static assert(false, "Unsupported type for NotEmptyValidator: " ~ T.stringof);
        }

    }

    override string getMessage()
    {
        return _notempty.message;
    }
}
