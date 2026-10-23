using System;
using System.ComponentModel.DataAnnotations;

namespace NeoStart.ValidationCheckbox
{
    public class ValidateCheckBoxes : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
         
            if (value is bool booleanValue)
            {
                return booleanValue; 
            }
            return false;
        }
    }
}
