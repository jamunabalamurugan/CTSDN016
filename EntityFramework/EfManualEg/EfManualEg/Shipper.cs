using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
namespace EfManualEg
{
    [Table("Shippers")]
    class Shipper
    {
        [Key]
        public int ShipperID { get; set; }
        public string CompanyName { get; set; }
        public string phone { get; set; }
    }
    [Table("Region")]
    class Region
    {
        [Key]
        public int RegionId { get; set; }
        public string RegionDescription { get; set; }
    }
    [Table("Categories")]
    class Category
    {
        [Key]
        public int CategoryID { get; set; }
        public string CategoryName { get; set; }
        public string Description { get; set; }
        public byte[] Picture { get; set; }
    }
    class MyNorthwindDb:DbContext
    {
        public MyNorthwindDb() : base("MyNorthwindDb") 
        { }
        public DbSet<Shipper> Shippers { get; set; }
        public DbSet<Region> DummyRegions { get; set; }
        public DbSet<Category> Categories { get; set; }
    }
}
