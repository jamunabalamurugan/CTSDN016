using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RemoteValidationEg.Models
{
    public class StudentLogin
    {
        [Key]
        [RemoteAttribute("IsStudentExists", "Login",
            ErrorMessage = "Student Id Does not exist")]
        public int Sid { get; set; }
        
        public string Pwd { get; set; }
    }
}