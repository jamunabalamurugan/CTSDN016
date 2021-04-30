using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InheritanceEgInternal
{
  public class AnimalEg
    {
        internal protected string AnimalName()
        {
            return "LION";
        }
        protected void Welcome()
        {
            Console.WriteLine("Welcome  to Protected");
        }
        internal void Hello()
        {
            Console.WriteLine("Hello is accesible within the same application");
        }
    }
}


