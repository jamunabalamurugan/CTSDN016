using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ModelValidationEg.Models
{
    public class DateValidationAttribute:ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            DateTime todayDate = Convert.ToDateTime(value);
            return todayDate <= DateTime.Now;
        }
    }
    public class AdultAgeValidationAttribute:ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            int givenAge = int.Parse(value.ToString());
            if(givenAge<21)
            {
                return new ValidationResult("The age should be greater than 21");
            }
            else
            {
                return ValidationResult.Success;
            }
        }
    }
}