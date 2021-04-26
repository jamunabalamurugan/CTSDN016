using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesAndObjects
{
    class Class1
    {
        int id;
        string name;

        Class1(int id,string name)
            {
            this.id=id;
            this.name=name;
            }
        void Display()
        {
            Console.WriteLine(id+"\t"+name);
        }
      

        static void Main()
        {
            int id;
            string name;
            Class1[] c1 = new Class1[2];
            for (int i=0;i<2;i++)
            {
                Console.WriteLine("enter the id and name");
                id=Convert.ToInt32(Console.ReadLine());
                name=Console.ReadLine();
               
                c1[i] = new Class1(id,name);

            }

            foreach (var item in c1)
            {
                item.Display();
            }
            Console.ReadKey();
        }
    }
}
