using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day3Project
{
    class Employee
    {
        protected int Id { get; set; }
        protected string Name { get; set; }

        public Employee() { Id = 100; Name = "Kanav"; }
        public Employee(int id, string name)
        {
            Id = id;
            Name = name;
        }
        public override string ToString()
        {
            return "Employee Id : " + Id + " Employee Name " + Name;
        }
    }

    class FullTimeEmployee : Employee
    {
        private double Salary;

        public FullTimeEmployee() { Salary = 20000; }
        public FullTimeEmployee(int id, string name, double salary) : base(id, name)//passing the id and name to base Calling the Overloaded constructor
        {
            this.Salary = salary;
        }
        public void DisplayFTE()
        {
            Console.WriteLine("Employee Id : " + Id + " Employee Name " + Name + "Salary : " + Salary);
        }

    }
}
