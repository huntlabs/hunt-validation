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

module hunt.validation.constraints.Range;

struct Range
{
    long min = long.min;
    long max = long.max;
    string message="must be between {{min}} and {{max}}";
}
