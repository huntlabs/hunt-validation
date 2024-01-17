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
module hunt.validation.validators.SizeValidator;

import hunt.validation.constraints.Size;
import hunt.validation.ConstraintValidator;
import hunt.validation.ConstraintValidatorContext;
import std.exception;
import hunt.validation.Validator;

import hunt.logging;
import std.string;
import std.traits;

public class SizeValidator(T) : AbstractValidator , ConstraintValidator!(Size, T) {

    private Size _size;

    override void initialize(Size constraintAnnotation){
        _size = constraintAnnotation;
    }
    
    override
    public bool isValid(T data, ConstraintValidatorContext constraintValidatorContext) {
         scope(exit) constraintValidatorContext.append(this);
        
        static if(isArray!(T) || isAssociativeArray!(T))
        {
            if( data.length < _size.min || data.length > _size.max)
            {
                _isValid = false;
            }
            else 
            {
                _isValid = true;
            }
            return _isValid;
        }
        else 
        {
            throw new Exception("not support type : ",T.stringof);
            _isValid = false;
            return false;
        }

    }

    override string getMessage()
    {
        import hunt.text.FormatterWrapper;
        import hunt.util.Serialize;

        return  new FormatterWrapper("{{","}}").format(_size.message,toJSON(_size));
    }
}
