using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DbFirstEg
{
    class Program
    {
        static void Main(string[] args)
        {
            NorthwindEntities db = new NorthwindEntities();
            Console.WriteLine("Press 1.Display Customer details\t 2.Display Product Details 0.Exit");
            int ch = int.Parse(Console.ReadLine());
            if (ch == 1)
            {
                foreach (var item in db.KKCustomers)
                {
                    Console.WriteLine(item.CustomerID + "\t" + item.ContactName);
                }
            }
            else if (ch == 2)
            {
                foreach (var item in db.KKProducts)
                {
                    Console.WriteLine(item.ProductID + "\t" + item.ProductName);
                }
            }
            else if(ch==3)
            {
                Customer cust = new Customer();
                cust.CustomerID = "JAM21";
                cust.ContactName = "Jamuna";
                cust.CompanyName = "CTS";
                db.KKCustomers.Add(cust);
                db.SaveChanges();
                Console.WriteLine("Customer Added to db succesfully");

            }
            else
                return;
            Console.ReadKey();

        }
    }
}
