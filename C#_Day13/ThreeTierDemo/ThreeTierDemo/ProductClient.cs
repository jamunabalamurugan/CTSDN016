using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProductBusinessLayer;
using ProductDAL;

namespace ThreeTierDemo
{
    class ProductClient
    {
        static void Main(string[] args)
        {
            ProductBAL balobj = new ProductBAL();
            DataSet ds = balobj.SelectDataBAL();
            DataTable dt = ds.Tables[0];
            foreach (DataRow dr in dt.Rows)
            {
                foreach (var item in dr.ItemArray)
                {
                    Console.WriteLine(item);
                }
            }
            Product p = new Product();
            p.ProductName = "Pepsi";
            p.UnitPrice = 70;
            p.CategoryId = 1;
            int res=balobj.InsertBAL(p);
            if(res>0)
                Console.WriteLine("New Product has been added succesfully");
            else
                Console.WriteLine("Sorry....we are unable to add new product");
            Console.Read();
        }
    }
}
