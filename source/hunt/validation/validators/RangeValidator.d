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
module hunt.validation.validators.RangeValidator;

import hunt.validation.constraints.Range;
import hunt.validation.ConstraintValidator;
import hunt.validation.ConstraintValidatorContext;
import hunt.validation.Validator;
import hunt.logging;
import std.string;

// alias Range = hunt.validation.constraints.Range.Range;

public class RangeValidator : AbstractValidator , ConstraintValidator!(Range, long) {

    private Range _range;

    override void initialize(Range constraintAnnotation){
        _range = constraintAnnotation;
    }
    
    override
    public bool isValid(long data, ConstraintValidatorContext constraintValidatorContext) {
        scope(exit) constraintValidatorContext.append(this);
        if( data < _range.min || data > _range.max)
        {
            _isValid = false;
        }
        else
        {
            _isValid = true;
        }
        return _isValid;

    }

    override string getMessage()
    {
        import hunt.text.FormatterWrapper;
        import hunt.util.Serialize;

        return  new FormatterWrapper("{{","}}").format(_range.message,toJson(_range));
    }
}
