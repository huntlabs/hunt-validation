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

public class NotEmptyValidator(T) : AbstractValidator , ConstraintValidator!(NotEmpty, T) {

    private NotEmpty _notempty;

    override void initialize(NotEmpty constraintAnnotation){
        _notempty = constraintAnnotation;
    }
    
    override
    public bool isValid(T data, ConstraintValidatorContext constraintValidatorContext) {
        scope(exit) constraintValidatorContext.append(this);
        
        if(data is null)
        {
            _isValid = false;
            return false;
        }

        static if(isArray!(T) || isAssociativeArray!(T) || is(T == string))
        {    
            _isValid =  data.length > 0;
            return _isValid;
        }
        else 
        {
            throw new ValidationException("not support type : ",T.stringof);
            _isValid = false;
            return false;
        }

    }

    override string getMessage()
    {
        return _notempty.message;
    }
}
