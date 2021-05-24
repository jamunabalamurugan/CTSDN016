using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DbFirstEg
{
    //Specifies the Database table that the Class is mapped to
   
   [Table("Shippers")]
    public class Shipper
    {
       [Key]
        public int ShipperID { get; set; }
        public string CompanyName { get; set; }
        public string phone { get; set; }
    }
    [Table("Region")]
    public class Region
    {
        [Key]
        public int RegionId { get; set; }
        public string RegionDescription { get; set; }
    }
    [Table("Categories")]
    public class Category
    {
        [Key]
        public int CategoryID { get; set; }
        public string CategoryName { get; set; }
        public string Description { get; set; }
        public byte[] Picture { get; set; }
    }
    public class KKEntities: DbContext
    {
        public KKEntities() : base("EfManualEntities") { }

        public DbSet<Shipper> Ships { get; set; }
        public DbSet<Category> Categories { get; set; }

        public DbSet<Region> Regions { get; set; }
    }
    public class EfManual
    {
        public  KKEntities db = new KKEntities();
        public  void ShipperDetails()
        {
            foreach (var item in db.Ships)
            {
                Console.WriteLine(item.ShipperID);
                Console.WriteLine(item.CompanyName);
                Console.WriteLine(item.phone);

            }
            Console.ReadKey();
        }
        public  void Insert()
        {
            Shipper obj = new Shipper();
            //obj.ShipperID = 7;
            //obj.CompanyName = "CTS";
            //obj.phone = "12345678";
            Console.WriteLine("Enter the Shippers company name");
            obj.CompanyName = Console.ReadLine();
            Console.WriteLine("Enter Phoneno");
            obj.phone = Console.ReadLine();

            db.Ships.Add(obj);

            // Summary:
            //     Saves all changes made in this context to the underlying database.
            //
            // Returns:
            //     The number of state entries written to the underlying database.
            int i=db.SaveChanges();
            Console.WriteLine("{0} Shipper Inserted",i);
            Console.ReadKey();
        }
        public  void Edit()
        {
            Console.WriteLine("Pls enter shipper Id for Editting");
            int id = Convert.ToInt32(Console.ReadLine());
            Shipper obj = db.Ships.Find(id);
            Console.WriteLine("Pls enter the New Company Name");
            obj.CompanyName = Console.ReadLine();
            db.Entry(obj).State = EntityState.Modified;
            db.SaveChanges();
        }
        public  void Delete()
        {
            Console.WriteLine("Enter Shipper Id");
            int id = Convert.ToInt32(Console.ReadLine());
            Shipper obj = db.Ships.Find(id);
            if (obj != null)
            {
                Console.WriteLine("Are you sure to delete?");
                string choice = Console.ReadLine();
                if (choice == "yes")
                {
                    db.Ships.Remove(obj);
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
        public  void DisplayRegions()
        { 
            foreach (var item in db.Regions)
            {
                Console.WriteLine(item.RegionId + "\t" + item.RegionDescription);
            }
            foreach (var item in db.Categories)
            {
                Console.WriteLine(item.CategoryID + "\t" + item.CategoryName + "\t" + item.Description);
            }
        }

        public static void Main()
        {
            EfManual ef = new EfManual();
            

            while (true)
            {
                Console.WriteLine("Welcome to Northwind Project");
                Console.WriteLine("Enter 1.Display\t 2.Insert\t 3.Edit\t 4.Delete 5.Display Regions 0.Exit");
                int choice = 0;
                choice = Convert.ToInt32(Console.ReadLine());
                switch (choice)
                {
                    case 1:
                        ef.ShipperDetails();
                        break;
                    case 2:
                        ef.Insert();
                        break;
                    case 3:
                        ef. Edit();
                        break;
                    case 4:
                        ef.Delete();
                        break;
                    case 5:
                        ef.DisplayRegions();
                        break;

                    case 0:
                        Console.WriteLine("Exiting.....");
                        return;
                }
            }
        
        Console.ReadKey();

        }
    }
}
