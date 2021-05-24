using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseFirst
{
    class Program
    {
        static void Main(string[] args)
        {
            DataAccessHelper dal = new DataAccessHelper();
            while (true)
            {
                Console.WriteLine("Welcome to Northwind Project");
                Console.WriteLine("Enter 1.Display\t 2.Insert\t 3.Edit\t 4.Delete 5.Display Most Expensive Products 0.Exit");
                int choice = 0;
                choice = Convert.ToInt32(Console.ReadLine());
                switch (choice)
                {
                    case 1:
                        //var result=dal.ShowMyProducts();
                        var result = dal.ShowDiscontinuedProducts();
                        foreach (var item in result)
                        {
                            //Entity Framework supports three ways to load related data 
                            //1. Eager loading 2. lazy loading 3. explicit loading.
                            // Console.WriteLine(item.productid+"\t"+item.productname);
                            Console.WriteLine(item.ProductID + "\t" + item.ProductName+"\t"+
                                item.Category.CategoryName+"\t"+item.Supplier.ContactName);
                        }
                        break;
                    //case 2:
                    //    Insert();
                    //    break;
                    //case 3:
                    //    Edit();
                    //    break;
                    //case 4:
                    //    Delete();
                    //    break;
                    case 5:
                        var meps=dal.DisplayMEP();
                        var salesresult = dal.DisplaySalesByCountry().Where(d=>d.Country=="UK");

                        foreach (var item in meps)
                        {
                            Console.WriteLine(item.TenMostExpensiveProducts+"\t"+item.UnitPrice);
                        }

                        foreach (var item in salesresult)
                        {
                            Console.WriteLine(item.Country+"\t"+item.FirstName+"\t"+item.SaleAmount);
                        }
                        break;

                    case 0:
                        Console.WriteLine("Exiting.....");
                        return;
                }
            }
        }
    }
}

