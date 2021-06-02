using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ScaffoldingEg.Models;
namespace ScaffoldingEg.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        NorthwindEntities db = new NorthwindEntities();
        public ActionResult Index()
        {
            var products = db.Products.ToList();
            return View(products);
        }
        public ActionResult DisplayProduct(int id)
        {
            Product p = db.Products.Find(id);
            return View(p);
        }
    }
}