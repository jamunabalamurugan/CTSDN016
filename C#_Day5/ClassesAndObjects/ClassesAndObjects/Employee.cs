using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesAndObjects
{
    class Employee
    {
        int Id;
        string EmployeeName;
        String City;

        void Display()
        {
            string organization="CTS";
            Console.WriteLine("Id :{0} && Name:{1} && City :{2}", Id, EmployeeName, City);
        }

        void GetData()
        {
           Id = 1001;
         EmployeeName = "Kavin";
        City = "Chennai";
        }
        static void Main()
        {
            Employee employee = new Employee();
            employee.GetData();
            employee .Display();
            Console.Read();

        }
    }
}
