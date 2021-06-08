using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace RemoteValidationEg.Models
{
    public class Student
    {
        [Key]
        public int Sid { get; set; }
        public string Sname { get; set; }
        public Nullable<decimal> Marks { get; set; }
       
        public string Email { get; set; }
       
        public string Pwd { get; set; }
       [DataType(DataType.DateTime)]
      // [AdultAgeValidation]
        public Nullable<System.DateTime> Dob { get; set; }
    }
}