using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseFirst
{
    class DataAccessHelper
    {
        NorthwindEntities db = new NorthwindEntities();

        public List<MyProduct> ShowMyProducts()
        {
            return db.MyProducts.ToList();//Calling the view MyProducts

            
        }
        public List<Product> ShowDiscontinuedProducts()
        {
            return db.Products.Where(p => p.Discontinued == false).ToList();
        }
        public List<Employee> FetchEmployees()
        {
            return db.Employees.ToList();


        }
        public List<Ten_Most_Expensive_Products_Result> DisplayMEP()
        {
            return db.Ten_Most_Expensive_Products().ToList();
        }

        public List<Employee_Sales_by_Country_Result> DisplaySalesByCountry()
        {
            return db.Employee_Sales_by_Country(DateTime.Parse("01/01/1996"), DateTime.Parse("12/31/1996")).ToList();
        }
    }
}
