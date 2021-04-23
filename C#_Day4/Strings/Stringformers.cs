using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WorkwithStrings
{
    class Stringformers
    {
        static void Main()
        {
            int _dollor = 1230;
            int _precentage = 134;
            double _fraction = 13.4456;
            string s = DateTime.Now.ToString();
            Console.WriteLine("Dollor Format:{0:C}", _dollor);
            Console.WriteLine("Percentage Format:{0:P}", _precentage);
            Console.WriteLine("Fraction Format:{0:F3}", _fraction);
            Console.WriteLine(s);
            DateTime d = DateTime.Now;
            Console.WriteLine("Long date:{0:D}", d);
            Console.WriteLine("short date:{0:d}", d);
            Console.WriteLine("Long Time:{0:T}", d);
            Console.WriteLine("short Time:{0:t}", d);
            Console.Read();
        }
    }
}
