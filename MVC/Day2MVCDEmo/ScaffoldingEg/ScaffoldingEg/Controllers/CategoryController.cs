using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ScaffoldingEg.Models;
namespace ScaffoldingEg.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        NorthwindEntities db = new NorthwindEntities();
        public ActionResult Index()
        {
            return View(db.Categories.ToList());
        }
        public ActionResult Details(int id)
        {
            return View(db.Categories.Find(id));
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Category c) //Two way Model Binding
        {
            if (ModelState.IsValid)
            {
                db.Categories.Add(c);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
                return View();
        }


        //[ActionName("Create")]
        //public ActionResult CreatePost()
        //{
        //    Category c = new Category();

        //    c.CategoryName = Request["categoryname"];
        //    c.Description = Request["description"];
        //    db.Categories.Add(c);
        //    db.SaveChanges();

        //    return RedirectToAction("Index");
        //}

        //public ActionResult Create(string CategoryName,string Description)
        //{
        //    Category c = new Category();
        //    c.CategoryName = CategoryName;
        //    c.Description = Description;
        //    db.Categories.Add(c);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        //public ActionResult Create(FormCollection frm)
        //{
        //    Category c = new Category();

        //    c.CategoryName =  frm.Get("categoryname");
        //    c.Description =  frm.Get("description");
        //    db.Categories.Add(c);
        //    db.SaveChanges();

        //    return RedirectToAction("Index");
        //}


        [HttpGet]
        public ActionResult Edit(int id=0)
        {
            Category c = db.Categories.Find(id);
            if (c == null)
                return HttpNotFound();

            return View(c);
        }
        [HttpPost]
        public ActionResult Edit(Category c)
        {
            if (ModelState.IsValid)
            {
                db.Entry(c).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
                return View();
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            Category category=db.Categories.Find(id);
            db.Categories.Remove(category);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult AddCategory()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddCategory(FormCollection frm)
        {
            Category c = new Category();

            c.CategoryName = "Coffee";// frm.Get("name");
            c.Description = "Favourite Drink";// frm.Get("desc");
            db.Categories.Add(c);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}