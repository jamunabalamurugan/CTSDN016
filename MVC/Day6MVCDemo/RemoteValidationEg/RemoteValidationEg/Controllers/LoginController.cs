using RemoteValidationEg.Data;
using RemoteValidationEg.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RemoteValidationEg.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login

      Students3Context db = new Students3Context();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult SignIn()
        {

            return View();
        }
        [HttpPost]
        public ActionResult SignIn(StudentLogin login)
        {
            if(ModelState.IsValid)
            {
                Session["Sid"] = login.Sid;
                TempData["Sid"] = login.Sid;
                TempData.Keep("Sid");
                
                ViewData["Sid"] = login.Sid;
                var result = (from s in db.Students
                             where s.Sid==login.Sid 
                             && s.Pwd==login.Pwd
                             select s).SingleOrDefault();
                if (result != null)
                {
                    return RedirectToAction("About", "Home");
                }
                else
                {
                    ModelState.AddModelError("", "Login Id and Password does not match");
                    return View();
                }
            }
            return View();
        }
        public bool IsExists(int Sid)
        {
            var result = db.Students.Find(Sid);
            if (result==null)
                return false;
            else
                return true;

        }
        //RemoteAttribute needs only JsonResult type Boolean
        public JsonResult IsStudentExists(int Sid)
        {
            return IsExists(Sid) ?
                Json(true, JsonRequestBehavior.AllowGet)
                : Json(false, JsonRequestBehavior.AllowGet);
        }
    }
}