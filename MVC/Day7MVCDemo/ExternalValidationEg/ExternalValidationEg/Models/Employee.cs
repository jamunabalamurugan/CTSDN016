using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ExternalValidationEg.Models
{
    public class Employee
    {
        [Key]
        public int eid { get; set; }
        public string ename { get; set; }
        public string email { get; set; }
        public string mobileno { get; set; }
    }
}