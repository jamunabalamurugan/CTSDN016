using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day4Project
{
    class CSharpFeatures
    {
        
        void UnderstandConstructors()
        {
            User user1 = new User();
            user1.PrintUserData();

            user1 = null;
            GC.Collect();//Will call the destructor for user1
            User user2 = new User("Kanav", "1234");
            user2.PrintUserData();
            User user3 = new User();
            user3.TakeUserData();
            user3.PrintUserData();
            Console.ReadKey();
        }
        void UnderstandingObjectArray()
        {
            User[] users = new User[3];
            for (int i = 0; i < 3; i++)
            {
                users[i] = new User();
                Console.WriteLine("Please enter the data for user "+(i+1));
                users[i].TakeUserData();
            }
            Console.WriteLine("Here comes data of all users");
            for (int i = 0; i < 3; i++)
            {
                users[i].PrintUserData();
            }
        }
        static void Main(string[] a)
        {
            CSharpFeatures csf = new CSharpFeatures();
            //csf.UnderstandingDatatypes();
            // UnderstandingArray();
            // csf.UnderstandingMultidimArray();
            //csf.UnderstandingJaggedArray();
            // csf.UnderstandingObjectArray();
            csf.UnderstandConstructors();
            Console.ReadKey();
        }
    }
}
