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
module hunt.validation.validators.MaxValidator;

import hunt.validation.constraints.Max;
import hunt.validation.ConstraintValidator;
import hunt.validation.ConstraintValidatorContext;
import hunt.validation.Validator;

// import hunt.lang;

public class MaxValidator : AbstractValidator , ConstraintValidator!(Max, long) {

    private Max _max;

    override void initialize(Max constraintAnnotation){
        _max = constraintAnnotation;
    }
    
    override
    public bool isValid(long data, ConstraintValidatorContext constraintValidatorContext) {
        //null values are valid
        scope(exit) constraintValidatorContext.append(this);
        if(data > _max.value)
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

        return  new FormatterWrapper("{{","}}").format(_max.message,toJson(_max));
    }
}
