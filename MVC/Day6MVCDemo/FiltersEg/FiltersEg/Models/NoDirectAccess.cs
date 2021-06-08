using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace FiltersEg.Models
{
    public class NoDirectAccessAttribute:ActionFilterAttribute
    {
        //public override void OnActionExecuting(ActionExecutingContext filterContext)
        //{
        //    //This is to check if the actionmethod is called 
        //    //through a menu option only
        //    if (filterContext.HttpContext.Request.Url.Host !=
        //        filterContext.HttpContext.Request.UrlReferrer.Host ||
        //        filterContext.HttpContext.Request.UrlReferrer == null)
        //    {
        //        filterContext.Result = new RedirectToRouteResult(
        //           new RouteValueDictionary(
        //           new { controller = "Account", action = "Login" }));
        //    }
        //    HttpContext.Current.Response.Write("OnActionExecuting:Please use the menu only");
            
        //}
        //public override void OnActionExecuted(ActionExecutedContext filterContext)
        //{
        //    HttpContext.Current.Response.Write("OnActionExecuted:Please use the menu only");
        //}
        //public override void OnResultExecuting(ResultExecutingContext filterContext)
        //{
        //    HttpContext.Current.Response.Write("OnResultExecuting:Please use the menu only");
        //}
    }
}