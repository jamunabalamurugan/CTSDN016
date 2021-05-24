using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EfManualEg
{

    class Program
    {
        static MyNorthwindDb db = new MyNorthwindDb();
        public static void ShipperDetails()
        {
            foreach (var item in db.Shippers)
            {
                Console.WriteLine(item.ShipperID);
                Console.WriteLine(item.CompanyName);
                Console.WriteLine(item.phone);

            }
            Console.ReadKey();
        }
        public static void Insert()
        {
            Shipper obj = new Shipper();
            obj.ShipperID = 7;
            obj.CompanyName = "CTS";
            obj.phone = "12345678";

            db.Shippers.Add(obj);
            db.SaveChanges();
            Console.WriteLine("Shipper Inserted");
            Console.ReadKey();
        }
        public static void Edit()
        {
            Console.WriteLine("Pls enter shipper Id for Editting");
            int id = Convert.ToInt32(Console.ReadLine());
            Shipper obj = db.Shippers.Find(id);
            Console.WriteLine("Pls enter the New Company Name");
            obj.CompanyName = Console.ReadLine();
            db.Entry(obj).State = EntityState.Modified;
            db.SaveChanges();
        }
        public static void Delete()
        {
            Console.WriteLine("Enter Shipper Id");
            int id = Convert.ToInt32(Console.ReadLine());
            Shipper obj = db.Shippers.Find(id);
            if (obj != null)
            {
                Console.WriteLine("Are you sure to delete?");
                string choice = Console.ReadLine();
                if (choice == "yes")
                {
                    db.Shippers.Remove(obj);
                    db.SaveChanges();
                    Console.WriteLine("Record Deleted");
                }
                else
                {
                    Console.WriteLine("Record Not deleted");
                }
            }
            else
            {
                Console.WriteLine("Invalid ShipperId....Pls try again");
            }
        }
        public static void DisplayRegions()
        {
            foreach (var item in db.DummyRegions)
            {
                Console.WriteLine(item.RegionId+"\t"+item.RegionDescription);
            }
            foreach (var item in db.Categories)
            {
                Console.WriteLine(item.CategoryID+"\t"+item.CategoryName+"\t"+item.Description);
            }
        }
        static void Main(string[] args)
        {
            while (true)
            {
                Console.WriteLine("Welcome to Northwind Project");
                Console.WriteLine("Enter 1.Display\t 2.Insert\t 3.Edit\t 4.Delete 5.Display Regions 0.Exit");
                int choice = 0;
                choice = Convert.ToInt32(Console.ReadLine());
                switch (choice)
                {
                    case 1:
                        ShipperDetails();
                        break;
                    case 2:
                        Insert();
                        break;
                    case 3:
                        Edit();
                        break;
                    case 4:
                        Delete();
                        break;
                    case 5:
                        DisplayRegions();
                        break;

                    case 0:
                        Console.WriteLine("Exiting.....");
                        return;
                }
            }
        }
    }
}
