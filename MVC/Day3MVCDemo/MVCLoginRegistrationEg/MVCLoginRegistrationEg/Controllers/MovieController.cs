using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCLoginRegistrationEg.Controllers
{
    public class MovieController : Controller
    {
        dbMovieShopEntities db = new dbMovieShopEntities();
        // GET: Movie
        public ActionResult Index()
        {
            ViewData["ServerTime"] = DateTime.Now;
            return View(db.tblMovies.ToList());
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            return View(db.tblMovies.Find(id));

        }
        [HttpPost]

        public ActionResult Edit(tblMovie obj)
        {
            if(ModelState.IsValid)
            {
                db.Entry(obj).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(obj);
        }
        public ActionResult Del(int id)
        {
            tblMovie m = db.tblMovies.Find(id);
            db.tblMovies.Remove(m);
            db.SaveChanges();
            return RedirectToAction("Index", "Home", null);
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            return View(db.tblMovies.Find(id));
        }
        [HttpPost]
        [ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            tblMovie m = db.tblMovies.Find(id);
            db.tblMovies.Remove(m);
            db.SaveChanges();
            return RedirectToAction("Index", "Home", null);
        }

        public ActionResult DisplayMovie()
        {
            tblMovie movie1111 = new tblMovie();
            movie1111.id = 10;
            movie1111.name = "Drishyam-2";
            movie1111.duration = 3;
            return View(movie1111);
        }

        public ActionResult UpcomingMovies()
        {
            string[] UpcomingMovies = { "Man of Steel", "World War Z", "Monsters University" };
            string[] StarCast = { "Henry Cavill, Amy Adams, Michael Shannon, Diane Lane", "Brad Pitt, Mireille Enos, Daniella Kertesz, Matthew Fox", "Billy Crystal, John Goodman, Steve Buscemi, Helen Mirren" };

            ViewBag.names = UpcomingMovies;
            ViewBag.starcast = StarCast;

            return View();
        }
    }
}