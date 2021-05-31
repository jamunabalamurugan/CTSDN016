using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Day1MVCDemo.Models
{
    public class Employee
    {
        public int eid { get; set; }
        public string ename { get; set; }
        public double salary { get; set; }

        public Employee(int id,string name,double sal)
        {
            eid = id;
            ename = name;
            salary = sal;
        }
        
    }
}