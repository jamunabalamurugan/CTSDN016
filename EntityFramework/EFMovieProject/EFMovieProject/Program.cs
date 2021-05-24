using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFMovieProject
{
    class Program
    {
        static dbMovieShopEntities db = new dbMovieShopEntities();
        static void Main(string[] args)
        {
            UserData userdata = new UserData();
            Console.WriteLine("Enter User Name & Password");
            userdata.username = Console.ReadLine();
            userdata.password = Console.ReadLine();
            Console.WriteLine("Please Retype Password");
            userdata.retypepassword = Console.ReadLine();
  
            db.UserDatas.Add(userdata);
            db.SaveChanges();

            foreach (var item in db.UserDatas)
            {
                Console.WriteLine(item.username+"\t"+item.password);
            }
            Console.ReadKey();

        }
    }
}
