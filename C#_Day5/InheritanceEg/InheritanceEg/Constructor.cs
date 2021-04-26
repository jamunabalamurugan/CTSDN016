using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InheritanceEg
{
    class Constructor
    {
        public int var1,var2;
        public Constructor(int v1,int v2)
        {
            this.var1 = v1;
            this.var2 = v2;
            Console.WriteLine("constructor is called");
        }
        ~ Constructor()
        {

            Console.WriteLine("destructor is called");

            Console.Read();
        }
        void Display()
        {

            Console.WriteLine("the variables are {0} and {1}", var1, var2);
        }
        static void Main()
        {
            Constructor cons = new Constructor(10,20);
            cons.Display();
           // Console.Read();
        }
    }
}
