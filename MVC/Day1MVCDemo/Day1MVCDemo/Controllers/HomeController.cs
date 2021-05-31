using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Day1MVCDemo.Controllers
{
    public class HomeController : Controller
    {

        public string Hello()
        {
            return "Welcome to MVC ASp.Net";
        }
        public List<string> ShowCountries()
        {
            return new List<string>()
            {
                "India",
                "UK",
                "US",
                "Singapore",
                "Srilanka"

            };
        }
        public ViewResult ShowCountriesAction()
        {
            ViewBag.Countries=new List<string>()
            {
                "India",
                "UK",
                "US",
                "Singapore",
                "Srilanka"

            };
            return View();
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}