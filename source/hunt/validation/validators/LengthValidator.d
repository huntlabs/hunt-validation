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
module hunt.validation.validators.LengthValidator;

import hunt.validation.constraints.Length;
import hunt.validation.ConstraintValidator;
import hunt.validation.ConstraintValidatorContext;
import hunt.validation.Validator;

import hunt.logging;
import std.string;

public class LengthValidator : AbstractValidator , ConstraintValidator!(Length, string) {

    private Length _length;

    override void initialize(Length constraintAnnotation){
        _length = constraintAnnotation;
    }
    
    override
    public bool isValid(string data, ConstraintValidatorContext constraintValidatorContext) {
        scope(exit) constraintValidatorContext.append(this);
        import std.utf;
        if(data.count < _length.min || data.count > _length.max)
        {
            _isValid = false;
            return false;
        }
        else
        {
            _isValid = true;
            return true;
        }

    }

    override string getMessage()
    {
        import hunt.text.FormatterWrapper;
        import hunt.util.Serialize;

        return  new FormatterWrapper("{{","}}").format(_length.message,toJson(_length));
    }

}
