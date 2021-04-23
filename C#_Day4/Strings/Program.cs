using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WorkwithStrings
{
    class Program
    {
        static void Main(string[] args)
        {
            //Declaration of a string
            string str = "Welcome to strings";
            string s1;
            //copy
            //s1=str
            s1 = string.Copy(str);
            s1 = " in c#";
            //concat
            //str = str + s1;
            str = string.Concat(str, s1);
            Console.WriteLine(str);
            s1 = "WelcoMe";
            string s2 = "welcome";
            //if (s1 == s2)
            //{
            //    Console.WriteLine("2 strings are equal");
            //}
            if (string.Compare(s1, s2,true) == 0)
            {
                Console.WriteLine("strings are equal");
            }
            else
            {
                Console.WriteLine("strings are not equal");
            }
            //toupper
            s1 = "welcome to hcl";
            Console.WriteLine(s1.ToUpper());
            //tolower
            Console.WriteLine(s1.ToLower());
            //length
            Console.WriteLine(s1.Length);
            //return a specific char
            Console.WriteLine(s1[5]);
            Console.Read();
           

        }
    }
}