using System;
using System.Collections.Generic;
using System.Collections;
using System.Reflection;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Generics
{
    class ListEg
    {
       static void Main()
        {
            int t;
            ArrayList al = new ArrayList();
            al.Add(10);
            al.Add(30.5f);

            List<int> lt = new List<int>();
            List<float> lt1 = new List<float>();
            lt.Add(10);
            lt.Add(20);
            lt.Add(30);
            //lt.Add(30.5f);--Will not store any other data type

            Console.WriteLine("Count :{0}",lt.Count);

            foreach(var list in lt)
            {
                Console.WriteLine(list);
            }

            Console.Read();
        }
        
       
    }
}
