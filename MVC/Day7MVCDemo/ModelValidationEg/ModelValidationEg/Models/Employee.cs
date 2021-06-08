using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ModelValidationEg.Models
{
    
    public class Employee
    {
        [Key]
        public int Eid { get; set; }

        [Required(ErrorMessage ="Please Enter your Name")]
        [Display(Name ="Employee Name",Prompt ="Enter your Name")]
        public string Ename { get; set; }

        [Required(ErrorMessage ="Please Enter your Email Address")]
        [Display(Name ="EmailID",Prompt ="Welcome",Description ="good evening")]
        [RegularExpression(@"^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$", ErrorMessage = "Please enter your correct Mail Address")]
        public string Email { get; set; }

        [Required(ErrorMessage ="Please Enter your Phone Number")]
        [StringLength(10,ErrorMessage ="Mobile no. contain 10 digits",MinimumLength =10)]
        public string PhoneNumber { get; set; }

        [DateValidation(ErrorMessage ="Sorry, The date cannot be later than today's Date")]
        public DateTime doj { get; set; }

        [AdultAgeValidation]
        public int Age { get; set; }
    }
}