using LG_05_Exercise_01.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LG_05_Exercise_01.Controllers
{
    public class FeedbackController : Controller
    {
        //
        // GET: /Registration/

        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.category = new SelectList(new[] { "Cards", "Electronics", "Toys", "Perfumes", "Watches" });
            return View();
        }

        [HttpPost]
        public ActionResult Create(Feedback customer)
        {
            return RedirectToAction("Thanks");
        }

        public ActionResult Thanks()
        {
            return View();
        }

    }
}