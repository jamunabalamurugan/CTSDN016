using System;
using System.Collections;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace InheritanceEg
{
    class ArrayList_eg
    {
        static void Main()
        {
            ArrayList al = new ArrayList();
            
            al.Add(10);
            al.Add("Doll");
            al.Add(23.04);
            al.Add(100);
            al.Add(67.90);
            foreach(object o in al)
            {
                Console.WriteLine("element in array list:{0}", o);
            }
            Console.WriteLine("Capacity:{0}", al.Capacity);
            Console.WriteLine("count:{0}", al.Count);
            al.Remove("doll");
            al.RemoveAt(2);
            ArrayList al1 = new ArrayList();
            al1.Add("new list");
            al1.Add(200);
            al.AddRange(al1);
            Console.WriteLine("new list");
            foreach(object o in al)
            {
                Console.WriteLine("ELEMENT:{0}", o);
            }
            Console.Read();
        }

    }
}
