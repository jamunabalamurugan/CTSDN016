using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WorkwithArrays
{
    class Array3
    {
        static void Main()
        {
            //char array
            char[] ch = { 'a', 'r', 'y', 'o' };
            Console.WriteLine(ch[2]);
            string[] s1 = new string[3];
            s1[0] = "David";
            s1[1] = "Peter";
            s1[2] = "Rahul";
            foreach (string s in s1)
            {
                Console.WriteLine(s);
            }
            Console.Read();
        }
    }
}
