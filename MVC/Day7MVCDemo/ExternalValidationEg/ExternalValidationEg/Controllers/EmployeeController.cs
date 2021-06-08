using ExternalValidationEg.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;

namespace ExternalValidationEg.Controllers
{
    public class EmployeeController : Controller
    {
        static List<Employee> emps = new List<Employee>();
        // GET: Employee
        public ActionResult Index()
        {
            return View(emps);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
       [ValidateAntiForgeryToken]
        public ActionResult Create(Employee obj)
        {
            if(string.IsNullOrEmpty(obj.ename))
            {
                ModelState.AddModelError("ename", "please enter your Name");
            }
            if(string.IsNullOrEmpty(obj.email))
            {
                ModelState.AddModelError("email", "Please enter your Email");
            }
            if (string.IsNullOrEmpty(obj.mobileno))
            {
                ModelState.AddModelError("mobileno", "Please enter your Email");
            }
            if(!string.IsNullOrEmpty(obj.email))
            {
                string emailreg = @"^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$";
                Regex re = new Regex(emailreg);
                if(!re.IsMatch(obj.email))
                {
                    ModelState.AddModelError("email", "Please enter a valid email address");
                }
            }

            if(!string.IsNullOrEmpty(obj.mobileno))
            {
                string phpat = @"^\(?([7-9]{3})\)?[-. ]?([0-6]{3})[-. ]?([0-9]{4})$";
                Regex reg = new Regex(phpat);
                if(!reg.IsMatch(obj.mobileno))
                {
                    ModelState.AddModelError("mobileno", "Enter your Mobile Number in proper format");
                }
            }
            if(ModelState.IsValid)
            {
        
                emps.Add(obj);
                //  return View("Index", emps);
                return RedirectToAction("Index","Employee",emps);
            }
            else
            {
                return View();
            }
        }

    }
}