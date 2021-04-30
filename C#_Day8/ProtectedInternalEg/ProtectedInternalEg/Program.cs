using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProtectedInternalEg
{
    public class AnimalEg
    {
      protected internal string AnimalName()
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
    class Program
    {
        static void  Main()
        {
            AnimalEg a = new AnimalEg();
            a.Hello();
            a.AnimalName();
            //a.Welcome();--Cannot call a protected method from another class
        }
    }

    class Zoo : AnimalEg
    {
        public void AccessAnimal()
        {
            Welcome();  //only accesible from derived class
            AnimalName();
            Hello();
        }
    }
}
