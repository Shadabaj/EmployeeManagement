using System;
using System.ComponentModel.DataAnnotations;

public class AgeAndFutureDateValidationAttribute : ValidationAttribute
{
    private readonly int _minimumAge;

    public AgeAndFutureDateValidationAttribute(int minimumAge = 18)
    {
        _minimumAge = minimumAge;
    }

    public override bool IsValid(object value)
    {
        if (value is DateOnly dateOfBirth)
        {
            var today = DateOnly.FromDateTime(DateTime.Today);
            var age = today.Year - dateOfBirth.Year;

        
            if (today.Month < dateOfBirth.Month || (today.Month == dateOfBirth.Month && today.Day < dateOfBirth.Day))
            {
                age--;
            }

 
            if (age < _minimumAge || dateOfBirth > today)
            {
                return false;
            }

            return true;
        }

        return false; 
    }
}
