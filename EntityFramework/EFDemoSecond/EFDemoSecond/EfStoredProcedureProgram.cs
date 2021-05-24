using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFDemoSecond
{
    class Program
    {
        JamunaCon db = new JamunaCon();
        void  DisplayStockStatus()
        {
            var result =db.stockstatus();
            Console.WriteLine("The Stock status is :");
            foreach (var item in result)
            {
                Console.WriteLine(item.productname+"\t"+item.UnitsinStock+"\t"+item.Stock_Status);
            }
        }

        void TenMostExpensive()
        {
            var result = db.Ten_Most_Expensive_Products();
            Console.WriteLine("Display of Most Expensive products");
            foreach (var item in result)
            {
                Console.WriteLine(item.TenMostExpensiveProducts + "\t" + item.UnitPrice);
            }
        }
        void EmployeeSales()
        {
            var emps = db.Employee_Sales_by_Country(DateTime.Parse("01/01/1996"),DateTime.Parse("12/12/1996"));
            foreach (var item in emps)
            {
                Console.WriteLine(item.FirstName+"\t"+item.SaleAmount);
            }

        }

        void DisplayActiveProducts()
        {
            //Linq---Language Integrated Query

            //Query Syntax-Uses syntax of SQL to a great extent

            //Method Syntax-Uses Lambda Expression =>

            var result = from p in db.Products
                           where p.Discontinued == false
                           select p;

            Console.WriteLine("List of Active Products");
            foreach (var item in result)
            {
                Console.WriteLine(item.ProductID+"\t"+item.ProductName);
            
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
                Console.WriteLine(item.ProductName + "\t" + item.CompanyName);

            }

        }

        public void CustByCountry()
        {
            Console.WriteLine("Enter the country");
            string str = Console.ReadLine();
            //Customer cust = mydb.Customers.Find(country);

            //IEnumerable<Customer> customers =
            var customers =
               ( from custs in db.Customers
                where custs.Country.Contains(str)
              //  select custs;
               select new { custs.ContactName, custs.Country });

            foreach (var item in customers)
            {
                Console.WriteLine(item.ContactName + " " + item.Country);

            }

            List<Customer> result =
             (from c in db.Customers
              where c.Country == str
              select c
               ).ToList();

            foreach (var item in result)
            {
                Console.WriteLine(item.CustomerID+"\t"+item.ContactName + " " + item.Country);

            }
        }

        void MethodSyntaxExample()
        {
            //int userCount = db.Customers.Where(u => u.CustomerID.Contains("K")).Count();
          
           int userCount = db.Customers.SqlQuery("Select * from Customers where customerid  like 'K%'").Count();
            Console.WriteLine("The total number of customers with ID starting in K : {0}", userCount);


            // db.Customers.SqlQuery("Select * from tbl_user where username='" + user.username + "' and password = '" + user.password + "'").Count();
            Console.WriteLine("Enter CustomerId");
            string cid = Console.ReadLine();
            Customer cust = db.Customers.Where(d => d.CustomerID == cid).FirstOrDefault();
            if(cust!=null)
            Console.WriteLine(cust.ContactTitle + "\t" + cust.ContactName);

            List<Customer> result = db.Customers.Where(u => u.CustomerID.Contains(cid)).ToList();
            foreach (Customer cust1 in result)
            {
                Console.WriteLine(cust1.ContactTitle + "\t" + cust1.ContactName);
            }

     
            
        }


        static void Main(string[] args)
        {
            Program obj = new Program();
            obj.EmployeeSales();
           // obj.TenMostExpensive();
            //obj.DisplayActiveProducts();
            //obj.DisplayCategorywiseProduct();
            // obj.CustByCountry();
            // obj.MethodSyntaxExample();
           // obj.DisplayStockStatus();
            Console.ReadKey();
        }
    }
}
