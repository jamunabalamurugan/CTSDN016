using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCodeFirst
{
    class Program
    {
        static void Main(string[] args)
        {
            Department department = new Department
            {
                DepartmentName = "Sales",
                Employees = new List<Employee>
                {
                    new Employee() {EmployeeName = "Kavin"},
                    new Employee() {EmployeeName = "Kanav"},
                    new Employee() {EmployeeName = "Sumedha"}
                }
            };
            DataAccessHelper dbHelper = new DataAccessHelper();
            dbHelper.AddDepartment(department);
            // var addedDepartment = dbHelper.FetchDepartments().FirstOrDefault();
            var addedDepartment = dbHelper.FetchDepartments();
            if (addedDepartment != null)
            {
                // Console.WriteLine("Department Name is: " +
                //                   addedDepartment.DepartmentName + Environment.NewLine);
                foreach (var item in addedDepartment)
                {
                    Console.WriteLine(item.DepartmentId+"\t"+item.DepartmentName);

                    Console.WriteLine("Department Employees are: \n");
                    foreach (var addedDepartmentEmployee in item.Employees)
                    {
                        Console.WriteLine(addedDepartmentEmployee.EmployeeName + Environment.NewLine);
                    }
                }
                Console.ReadLine();
            }
        }
    }
}
