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

module hunt.validation.ConstraintValidatorContext;
import hunt.validation.Validator;

interface ConstraintValidatorContext  {
    
    /**
     * return valid string
     */
    string toString();

    /**
     * append validator
     */
    ConstraintValidatorContext append(Validator);

    /**
     * if it is valid 
     */
    bool isValid();

    /**
     * Get all errors associated with a field
     * @ the key is filed's name and the value is error message
     * Note : Multiple errors for the same field will only return one
     */
    string[string] messages();

}