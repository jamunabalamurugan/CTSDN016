using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCLoginRegistrationEg.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        dbMovieShopEntities db = new dbMovieShopEntities();
        public ActionResult Index()
        {
            return View(db.UserDatas.ToList());
        }
        public ActionResult UserRegister()
        {
            return View();
        }
        [HttpPost]
        public ActionResult UserRegister(FormCollection frm)
        {
            UserData user = new UserData();
            if (frm.Get("password").Equals(frm.Get("RePass")))
            {
                user.username = frm.Get("username");
                user.password = frm.Get("password");
                db.UserDatas.Add(user);
                db.SaveChanges();
                TempData.Add("username", user.username);
                return RedirectToAction("UserLogin");

            }
            return View();
        }

        public ActionResult UserLogin()
        {
            UserData myUser = new UserData();
            if (TempData["username"] != null)
                myUser.username = TempData["username"].ToString();
            return View(myUser);
        }
        [HttpPost]
        public ActionResult UserLogin(UserData user)
        {
            if (ModelState.IsValid)
            {
                //select count(*) from userData where username = @username and password = @pass
                int myUser = db.UserDatas.Where(u => u.username == user.username && u.password == user.password).Count();
                if (myUser == 1)
                    ViewBag.message = "Welcome.. Your login is success!!!";
                else
                    ViewBag.message = "Invalid Username or password";
            }
            return View();
        }
    }
}