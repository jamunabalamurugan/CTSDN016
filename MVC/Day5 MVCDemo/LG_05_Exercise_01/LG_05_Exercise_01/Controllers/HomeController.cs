using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LG_05_Exercise_01.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ContactUs()
        {
            return View();
        }


        public ActionResult Offers()
        {
            string[] Offers = { "10% discount on Mugs worth 40 USD.", "Buy one soft toy of worth 100 USD and get another free.", "20% cash back offer on every purchase on weekends." };
            ViewBag.offers = Offers;

            return View();

        }




    }
}
