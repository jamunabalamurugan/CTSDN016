using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Day1MVCDemo.Models;
namespace Day1MVCDemo.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Employee

        public ActionResult Index()
        {

            Employee emp = new Employee(101, "Kavin", 2500000);
            return View(emp);
        }
        public ViewResult ShowEmployee()
        {

            Employee emp = new Employee(101,"Kavin",2500000);
           // ViewBag.empdetail = emp;
            return View("Index",emp);
        }

        public ActionResult ShowEmployees()
        {
            Employee emp1 = new Employee(101, "Kavin", 2500000);
            Employee emp2 = new Employee(102, "Kanav", 2200000);
            Employee emp3 = new Employee(103, "Sumedha", 2100000);
            List<Employee> employees = new List<Employee>();
            employees.Add(emp1);
            employees.Add(emp2);
            employees.Add(emp3);
            return View(employees);

        }
    }
}