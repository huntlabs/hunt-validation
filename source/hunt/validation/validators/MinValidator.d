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
module hunt.validation.validators.MinValidator;

import hunt.validation.constraints.Min;
import hunt.validation.ConstraintValidator;
import hunt.validation.ConstraintValidatorContext;
import hunt.validation.Validator;

// import hunt.lang;

public class MinValidator : AbstractValidator , ConstraintValidator!(Min, long) {

    private Min _min;

    override void initialize(Min constraintAnnotation){
        _min = constraintAnnotation;
    }
    
    override
    public bool isValid(long data, ConstraintValidatorContext constraintValidatorContext) {
        //null values are valid
        scope(exit) constraintValidatorContext.append(this);
        if(data < _min.value)
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

        return  new FormatterWrapper("{{","}}").format(_min.message,toJson(_min));
    }
}
