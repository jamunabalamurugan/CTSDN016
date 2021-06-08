using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FiltersEg.Controllers
{
    [RoutePrefix("Learn")]
    public class BooksController : Controller
    {
        // GET: Books
        public ActionResult Index()
        {
            return View();
        }
        [Route("All")]
        public ActionResult GetAllBooks()
        {
            return View();
        }
        [Route("{id:int?}")]
        public ActionResult GetBookById(int id)
        {
            return View();
        }
        [Route("{name}")]
        public ActionResult GetBookByName(string name)
        {
            return View();
        }

    }
}