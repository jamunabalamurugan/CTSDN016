using FiltersEg.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FiltersEg.Controllers
{
    [HandleError]
    [Authorize]
    //[RoutePrefix("CTS")]
    public class HomeController : Controller
    {
       static List<User> users = new List<User>()
       {
           new User("Kavin","1234"),
           new User("Kanav","4321"),
           new User("Sumedha","1111")
       };
        [AllowAnonymous]
        public ActionResult Index()
        {
            return View();
        }
        [Route("HelloAbout")]
    
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
//        [Authorize(Users="kanav@gmail.com")]
        [Route("ContactUs")]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [OutputCache(Duration = 10)]
       /// [NoDirectAccess]
        public string GetCurrentTime()
        {
            return DateTime.Now.ToString("T");
        }
        [AllowAnonymous]
        public string DemoErrors()
        {
            string msg = "Welcome to MVC !!!";
            try
            {
                int temp = 0;
                int j = 25 / temp;
                msg = j.ToString();
            }
            catch(Exception e)
            {
                msg = "Sorry....Something went wrong!"+e.Message;
            }

            return msg;
        }
     [NoDirectAccess]
        public ActionResult Demo()
        {
            int temp = 2;
            int j = 24 / temp;
            ViewBag.result = j;
            return View();
           // return RedirectToAction("Index");
        }

        public ActionResult OneMore()
        {
            //int i = int.MaxValue;
            int i = 10;
            checked
            {
                i++;
            }
            
            return RedirectToAction("Index");
        }

       [HandleError(ExceptionType = typeof(DivideByZeroException), View = "ViewPage1")]
        [AllowAnonymous]//Bypass authentication only for this action method
        public ActionResult AnotherProducts()
        {
            int num1 = 0, num2 = 10, result = 0;
            result = num2 / num1;

            return View();
        }
        [Authorize(Users="Sumedha@gmail.com")]
        public ActionResult GetUsers()
        {
            return View();
        }


    }
}