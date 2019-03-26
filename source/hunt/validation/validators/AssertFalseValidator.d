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
module hunt.validation.validators.AssertFalseValidator;

import hunt.validation.constraints.AssertFalse;
import hunt.validation.ConstraintValidator;
import hunt.validation.ConstraintValidatorContext;
import hunt.validation.Validator;

// import hunt.lang;

public class AssertFalseValidator : AbstractValidator , ConstraintValidator!(AssertFalse, bool) {

    private AssertFalse _assert;
    override void initialize(AssertFalse constraintAnnotation){
        _assert = constraintAnnotation;
    }
    
    override
    public bool isValid(bool bl, ConstraintValidatorContext constraintValidatorContext) {
        //null values are valid
        scope(exit) constraintValidatorContext.append(this);
        if(bl)
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
        return _assert.message;
    }

}
