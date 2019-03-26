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
module hunt.validation.validators.PatternValidator;

import hunt.validation.constraints.Pattern;
import hunt.validation.ConstraintValidator;
import hunt.validation.ConstraintValidatorContext;
import hunt.validation.Validator;
import hunt.logging;
import std.regex;

public class PatternValidator : AbstractValidator , ConstraintValidator!(Pattern, string) {

    private Pattern _pattern;

    override void initialize(Pattern constraintAnnotation){
        _pattern = constraintAnnotation;
    }
    
    override
    public bool isValid(string data, ConstraintValidatorContext constraintValidatorContext) {
        scope(exit) constraintValidatorContext.append(this);
        auto m = matchAll(data,regex(_pattern.pattern));
        if(m.empty)
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

        return  new FormatterWrapper("{{","}}").format(_pattern.message,toJson(_pattern));
    }

}
