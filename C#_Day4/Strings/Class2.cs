using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WorkwithStrings
{
    class Class2 <V>
    {
        public int add<T>(T a, V b)
        {
            string s = a.ToString();
            return 3;

        }
        public <V> sub(V a,V b)
        {
            return a;
        }
       
    }
    class Myclass
    {
        static void Main()
        {
            Class2<string> ob = new Class2<string>();
            
            Console.Read();
        }
    }
}
