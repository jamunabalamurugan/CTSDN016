using FluentValidation;
using FluentValidationExample.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FluentValidationExample.Validation
{
    public class FluentModelValidator : AbstractValidator<FluentModel>
    {
        public FluentModelValidator()
        {
            RuleFor(model => model.FullName).NotNull(); // Required

            RuleFor(model => model.EmailId).NotNull(); // Required

            RuleFor(model => model.EmailId).EmailAddress(); // email id

            RuleFor(model => model.Age).GreaterThan(18); // greater 18
        }
    }
}