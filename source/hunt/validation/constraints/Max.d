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

module hunt.validation.constraints.Max;

struct Max
{
    long value;
    string message="must be less than or equal to {{value}}";
}
