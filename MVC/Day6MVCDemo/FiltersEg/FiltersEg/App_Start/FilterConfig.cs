using FiltersEg.Models;
using System.Web;
using System.Web.Mvc;

namespace FiltersEg
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
            filters.Add(new NoDirectAccessAttribute());
        }
    }
}
