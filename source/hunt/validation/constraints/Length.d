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

module hunt.validation.constraints.Length;

struct Length
{
    int min = 0;
    int max = 0x7fffffff;
    string message="length must be between {{min}} and {{max}}";
}
