using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LayoutEg.Models;
namespace LayoutEg.Controllers
{
    public class MyLoginController : Controller
    {
        // GET: MyLogin
        NorthwindEntities db = new NorthwindEntities();
        public ActionResult Login()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Login(string UserName,string UserPwd)
        {
        //    if (UserName == "Kavin" && UserPwd == "1234")
        //    {
        //        Session["UserName"] = UserName;
        //        return RedirectToAction("Index","Home");
        //    }
            return View();
        }
        public ActionResult SignIn()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SignIn(CustomerLogin clogin)
        {
            if (ModelState.IsValid)
            {
                var result = (from c in db.Customers
                              where c.CustomerID == clogin.CustomerID
                              && c.CompanyName == clogin.CompanyName
                              select c.ContactName).SingleOrDefault();

                if (result != null)
                {
                    Session["UserName"] = result;
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", "Invalid Login Credentials...Pls try again");
                    return View();
                }
            }



            return View(clogin);
        }

        public ActionResult Index()
        {
            return View();
        }
    }
}