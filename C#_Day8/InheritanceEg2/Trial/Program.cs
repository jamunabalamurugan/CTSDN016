using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InheritanceEgInternal;

namespace Trial
{
    class Program:AnimalEg
    {
        static void Main(string[] args)
        {
            Program pobj = new Program();
           Console.WriteLine( pobj.AnimalName());
          //  pobj.Hello();It cannot access Hello method as it has internal scope only
            Console.Read();
        }
    }
}
