using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day4Project
{
    class User
    {
        public string Username { get; set; }
        public string Password { get; set; }

        public User()
        {
            Username = "Kavin";
            Password = "newuser123";
            Console.WriteLine("Default constructor called");
        }

        public User(string name,string password)
        {
            Username = name;
            Password = password;
            Console.WriteLine("Overloaded constructor  is called");
        }

        ~User()
        {
            Username = null;
            Password = null;
            Console.WriteLine("Detsructor is called");
        }
        public void TakeUserData()
        {
            Console.WriteLine("Pleae enter the username");
            Username = Console.ReadLine();
            Console.WriteLine("Pleae enter the password");
            Password = Console.ReadLine();
        }
        public void PrintUserData()
        {
            Console.WriteLine("User name is "+Username);
            string maskedPassword = "";
            for (int i = 0; i <Password.Length; i++)//4
            {
                if (i < 2)
                    maskedPassword += Password[i];//ra**
                else
                    maskedPassword += "*";
            }
            Console.WriteLine("Password is " + maskedPassword);
        }
    }
}
