using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InheritanceEg
{
    class Organization
    {
        protected string OrganizationName;
        string City;
        protected int Orgid;
        public Organization()
        {
            OrganizationName = "NIIT";
            City = "Delhi";
            Console.WriteLine("Default Constructor of Base Class called");
        }
        public Organization(string OrganizationName, string City)
        {
            this.OrganizationName = OrganizationName;
            this.City = City;
            Console.WriteLine("Base COnstructor");
        }
        public   void DisplayOrganizationDetails()
        {
            Console.WriteLine("OrganizationName :{0} && City {1}", OrganizationName, City);
        }
        ~Organization()
        {
            Console.WriteLine("Organization Destructor Invoked");
        }
    }
    class Employee : Organization
    {
      protected  string EmpName;
       
       public Employee(string OrganizationName, 
           string City,string EmpName):base(OrganizationName, City)
        {

           this.EmpName=EmpName;
            Console.WriteLine("Derived class Employee COnstructor");
        }
     public   void DisplayEmpDetails()
        {
            DisplayOrganizationDetails();
            Orgid = 100;
            Console.WriteLine("EmpName{0} && OrgName{1}", EmpName, OrganizationName);
        }

        ~Employee()
        {
            Console.WriteLine("Employee Destructor Invoked");
        }
    }

    class EmpPerformance : Employee
    {
        int Rating;
        public EmpPerformance(string OrganizationName,
          string City, string EmpName,int Rating)
            : base(OrganizationName, City, EmpName)
        {
            this.Rating = Rating;
            
            Console.WriteLine("Derived class EmpPerformace COnstructor");
        }

        public void DisplayPerformance()
        {
            DisplayEmpDetails();
            Console.WriteLine("EmpName{0} && Performance {1}", EmpName, Rating);
        }
        ~EmpPerformance()
        {
            Console.WriteLine("Performance Destructor Invoked");
        }
    }
    class SingleInheritanceEg
    {
        static void Main()
        {
            EmpPerformance employee = new EmpPerformance("CTS","Chennai","KAVIN",1);
           
            employee.DisplayPerformance();
            Console.Read();
        }
    }
}
