using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace PhotoExample.Models
{
    [Table("tblStudents")]
    public class Student
    {
        [Key]
        public int StudentId { get; set; }
        public string StudentName { get; set; }
        public string Password { get; set; }
        public string Photo { get; set; }

        public string Email { get; set; }
    }
}