using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCodeFirst
{
    class Program
    {
        DataAccessHelper dbHelper = new DataAccessHelper();
        public void AddEmp()
        {
            Employee emp = new Employee();
            Console.WriteLine("Enter Employee  Name");
            emp.EmployeeName = Console.ReadLine();
            Console.WriteLine("Enter Department Id");
            emp.DepartmentId = Convert.ToInt32(Console.ReadLine());
                      
            dbHelper.AddEmployee(emp);
        }
        public void DisplayEmp()
        {
            var employees = dbHelper.FetchEmployees();
            foreach (var item in employees)
            {
                Console.WriteLine(item.EmployeeId + "\t" + item.EmployeeName + "\t" + item.DepartmentId + "\t" + item.Departments.DepartmentName);
            }

        }
        public void AddDep()
        {
            Department department = new Department
            {
                DepartmentName = "IT",

                Employees = new List<Employee>
                {
                    new Employee() {EmployeeName = "Kavin2"},
                    new Employee() {EmployeeName = "Kanav2"},
                    new Employee() {EmployeeName = "Sumedha2"}
                }
            };
            dbHelper.AddDepartment(department);
        }
        public void DisplayDep()
        {
            var addedDepartment = dbHelper.FetchDepartments();
            if (addedDepartment != null)
            {
                // Console.WriteLine("Department Name is: " +
                //                   addedDepartment.DepartmentName + Environment.NewLine);
                foreach (var item in addedDepartment)
                {
                    Console.WriteLine(item.DepartmentId + "\t" + item.DepartmentName);

                    Console.WriteLine("Department Employees are: \n");
                    foreach (var emp in item.Employees)
                    {
                        Console.WriteLine(emp.EmployeeName + Environment.NewLine);
                    }
                }
                Console.ReadLine();
            }
        }
        static void Main(string[] args)
        {

            Program p = new Program();
            p.AddEmp();
            p.DisplayEmp();
            Console.ReadKey();
          
           
           
           
        }
    }
}
