using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelFirst
{
    class Program
    {
        static void Main(string[] args)
        {
            Model1Container db = new Model1Container();
            Customer customer = new Customer();
            Console.WriteLine("Enter Customer Name");
            customer.Name = Console.ReadLine();
            Console.WriteLine("Enter City");
            customer.City = Console.ReadLine();
            db.Customers.Add(customer);
            db.SaveChanges();

            foreach (var item in db.Customers)
            {
                Console.WriteLine(item.CustomerId+"\t"+item.Name+"\t"+item.City);
            }

            foreach (var item in db.Categories)
            {
                Console.WriteLine(item.Id + "\t" + item.DOM + "\t" + item.Units);
            }
            Console.ReadLine();
        }
    }
}
