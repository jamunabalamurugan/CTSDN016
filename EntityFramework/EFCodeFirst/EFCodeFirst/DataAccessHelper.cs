using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCodeFirst
{
    public class DataAccessHelper
    {
        readonly CodeFirstContext db = new CodeFirstContext();

        public List<Employee> FetchEmployees()
        {
            return db.Employees.ToList();


        }
        public Employee FetchCTSEmployees()
        {
            var result = (from emp in db.Employees
                          where emp.DepartmentId == 1
                          select emp).FirstOrDefault(); 
            return result;
        }
        public Employee GetEmployee(int id)
        {
            return db.Employees.Find(id);
        }

        public List<Department> FetchDepartments()
        {
            return db.Departments.ToList();
        }

        public int AddEmployee(Employee employee)
        {
            db.Employees.Add(employee);
            db.SaveChanges();
            return employee.EmployeeId;
        }

        public int AddDepartment(Department department)
        {
            db.Departments.Add(department);
            db.SaveChanges();
            return department.DepartmentId;
        }
    }

}
