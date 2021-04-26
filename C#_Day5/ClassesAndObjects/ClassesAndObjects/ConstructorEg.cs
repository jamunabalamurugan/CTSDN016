using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesAndObjects
{
    class EmployeeDetails
    {  string temp;
        int id;
        int Salary;
        int Ranking;
        //default constructor
       internal EmployeeDetails()
        {
            Console.WriteLine("Default Constructor");
        }
       public  EmployeeDetails(int Empid,int Empsalary)
        {
            id = Empid;
           Salary = Empsalary;

        }
        public EmployeeDetails(string temp)
        {
          this.temp = temp;
        }
        public EmployeeDetails(int Ranking)
        {
           this.Ranking = Ranking;
        }
      internal  void DisplayDetails()
        {
            Console.WriteLine("Id :{0} && Salary {1} && Ranking:{2}",
                id, Salary,Ranking);
        }
    }
    class ConstructorEg
    {
        static void Main()
        {
            EmployeeDetails ob1 = new EmployeeDetails();
            EmployeeDetails employeeDetails1 = new EmployeeDetails(1001,45000);
            EmployeeDetails employeeDetails2 = new EmployeeDetails(1);
            employeeDetails1.DisplayDetails();
            employeeDetails2.DisplayDetails();
            Console.Read();
        }
    }
}
