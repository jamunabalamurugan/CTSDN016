using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Web.Mvc;

namespace RemoteValidationEg.Models
{
    [Table("Customer")]
    public class Customer
    {
        [Key]
        public int CustomerId { get; set; }
        public string CustomerName { get; set; }
        [RemoteAttribute("IsUserExists","Customer",ErrorMessage ="User Already Exists!!! Sorry, Choose another name")]
        public string UserId { get; set; }
        public string msg { get; set; }
        public string city { get; set; }
    }

    public class CustomerContext:DbContext
    {
        public DbSet<Customer> customers { get; set; }
    }
}