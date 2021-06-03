using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LayoutEg.Models
{
    public class CustomerLogin  //View  Model
    {
        [Key]
        [Required]
        [DisplayName("Enter Login ID")]
        public string CustomerID { get; set; }
        [Required]
        [DisplayName("Enter Password")]
        [DataType(DataType.Password)]
        public string CompanyName { get; set; }

        public string ContactName { get; set; }
    }
}