using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace FluentValidationExample.Models
{
    public class FluentModel
    {
        [Key]

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int AutoId { get; set; }

        public string FullName { get; set; }

        public string EmailId { get; set; }

        public DateTime DateOfBirth { get; set; }

        public int Age { get; set; }
    }
}