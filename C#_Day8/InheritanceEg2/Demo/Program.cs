using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InheritanceEg2;


namespace Demo
{
    class Program: AnimalEg
    {
        static void Main(string[] args)
        {
            Program pobj = new Program();
            Console.WriteLine(pobj.AnimalName());
            Console.Read();
        }
    }
}
