using System;
using System.ComponentModel.DataAnnotations;

namespace NeoStart.Models
{
    public class DateLessThanTodayAttribute : ValidationAttribute
    {
        public DateLessThanTodayAttribute() : base("The date must be less than or equal to today's date.")
        {
        }

        public override bool IsValid(object value)
        {
            if (value is DateTime dateTime)
            {
                return dateTime <= DateTime.Today; 
            }
            return false;
        }
    }
}
