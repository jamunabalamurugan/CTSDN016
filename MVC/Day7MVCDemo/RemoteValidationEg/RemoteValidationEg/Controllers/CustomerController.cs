using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RemoteValidationEg.Models;

namespace RemoteValidationEg.Controllers
{
    public class CustomerController : Controller
    {
        CustomerContext cs = new CustomerContext();
        // GET: Customer
        public ActionResult Index()
        {
         return View(cs.customers.ToList());
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Customer C)
        {
            if(ModelState.IsValid)
            {
               string uid = C.UserId.ToString();
                if (IsExist(uid) == true)
                {
                    cs.customers.Add(C);
                    cs.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                  Response.Write("The User Already Exists");
                    return View();
                    //return Redirect("~/Shared/Error.cshtml");
                }
            }
            else
            {
                return View();
            }
        }

        public bool IsExist(string UserId)
        {
            if (string.IsNullOrEmpty(UserId)) return false;
            var result = (from r in cs.customers
                          where r.UserId == UserId.ToString()
                          select r).ToList();
            if (result.Count != 0)
                return false;
            else
                return true;
        }

        public JsonResult IsUserExists(string UserId)
        {
            return IsExist(UserId) ? Json(true, JsonRequestBehavior.AllowGet) :
                Json(false, JsonRequestBehavior.AllowGet);
        }
    }
}