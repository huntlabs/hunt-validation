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

module hunt.validation.constraints.Size;

struct Size
{
    int min = int.min;
    int max = int.max;
    string message="size must be between {{min}} and {{max}}";
}
