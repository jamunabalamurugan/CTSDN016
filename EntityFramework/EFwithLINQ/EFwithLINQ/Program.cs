using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFwithLINQ
{

    class Program
    {
        NorthwindEntities db = new NorthwindEntities();
        void DisplayActiveProducts()
        {
            //Linq---Language Integrated Query

            //Query Syntax-Uses syntax of SQL to a great extent

            //Method Syntax-Uses Lambda Expression =>

            var result = from p in db.Products
                         where p.Discontinued == true
                         select p;

            Console.WriteLine("List of Active Products");
            foreach (var item in result)
            {
                Console.WriteLine(item.ProductID + "\t" + item.ProductName);

            }

        }

        public void DisplayCategorywiseProduct()
        {
            Console.WriteLine("Please Enter Category Id");
            int id = Convert.ToInt32(Console.ReadLine());
            var result = from prod in db.Products
                         where prod.CategoryID == id
                         //  select prod; This will select all columns from Products
                         select new
                         {
                             prod.ProductName,
                             prod.Category.CategoryName,
                             prod.Supplier.CompanyName
                         };

            foreach (var item in result)
            {
                Console.WriteLine(item.ProductName + "\t" + item.CategoryName+"\t"+item.CompanyName);

            }

        }



        static void Main(string[] args)
        {
            Program p = new Program();
            //  p.DisplayActiveProducts();
            p.DisplayCategorywiseProduct();
            Console.ReadKey();
        }
    }
}
