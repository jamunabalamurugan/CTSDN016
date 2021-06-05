using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LG_02_Activity_01.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {

            string[] UpcomingMovies = { "Man of Steel", "World War Z", "Monsters University" };
            string[] StarCast = { "Henry Cavill, Amy Adams, Michael Shannon, Diane Lane", "Brad Pitt, Mireille Enos, Daniella Kertesz, Matthew Fox", "Billy Crystal, John Goodman, Steve Buscemi, Helen Mirren" };

            ViewBag.names = UpcomingMovies;
            ViewBag.starcast = StarCast;
            return View();
        }

        public ActionResult AboutUs()
        {
           
            return View();
        }
        public ActionResult ContactUs()
        {
           
            return View();
        }

        public ActionResult UpcomingMovies()
        {
            string[] UpcomingMovies = { "Man of Steel", "World War Z", "Monsters University" };
            string[] StarCast = { "Henry Cavill, Amy Adams, Michael Shannon, Diane Lane", "Brad Pitt, Mireille Enos, Daniella Kertesz, Matthew Fox", "Billy Crystal, John Goodman, Steve Buscemi, Helen Mirren" };

            ViewBag.names = UpcomingMovies;
            ViewBag.starcast = StarCast;

            return View();
        }
        public ActionResult ShowAdv()
        {
            return View();
        }

    }
}
