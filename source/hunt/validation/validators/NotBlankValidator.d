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
module hunt.validation.validators.NotBlankValidator;

import hunt.validation.constraints.NotBlank;
import hunt.validation.ConstraintValidator;
import hunt.validation.ConstraintValidatorContext;
import hunt.validation.Validator;

import std.string;

public class NotBlankValidator : AbstractValidator , ConstraintValidator!(NotBlank, string) {

    private NotBlank _notblank;

    override void initialize(NotBlank constraintAnnotation){
        _notblank = constraintAnnotation;
    }
    
    override
    public bool isValid(string data, ConstraintValidatorContext constraintValidatorContext) {
        scope(exit) constraintValidatorContext.append(this);
        
        if(data is null || data.strip.length == 0)
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
        return _notblank.message;
    }
}
