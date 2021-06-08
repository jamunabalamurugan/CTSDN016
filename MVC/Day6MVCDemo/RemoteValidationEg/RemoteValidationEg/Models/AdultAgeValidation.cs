using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace RemoteValidationEg.Models
{
    public class AdultAgeValidationAttribute:ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            DateTime check = Convert.ToDateTime(value);
            if (check <= DateTime.Now)
            {
                TimeSpan age = DateTime.Now - check;
                if ((age.Days / 365) > 18)
                    return true;
                else
                    return false;
            }
            else
                return false;
        }
    }
}