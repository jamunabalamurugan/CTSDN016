using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewswithButtons.Models;

namespace ViewswithButtons.Controllers
{
    public class CustomerController : Controller
    {

        static List<Customer> customers = new List<Customer>();
        // GET: Customer
        public ActionResult Index()
        {
            return View(customers);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SaveForm(Customer obj)
        {
            ViewBag.Message = "Customer Added Succcessfully";
            customers.Add(obj);
            return View("Index", customers);
        }

        [HttpPost]
        public ActionResult CancelForm(Customer obj)
        {
            ViewBag.Message = "The operation was cancelled";
            return View("Index", customers);
        }
      /*  public ActionResult Create(Customer c,string Save, string Cancel)
        {
            if(!string.IsNullOrEmpty(Save))
            {
                customers.Add(c);
                ViewBag.Message = "Data was Added";
            }
            if(!string.IsNullOrEmpty(Cancel))
            {
                ViewBag.Message = "Data was Cancelled and not Added";
            }
            return RedirectToAction("Index", customers);
        }*/
    }
}