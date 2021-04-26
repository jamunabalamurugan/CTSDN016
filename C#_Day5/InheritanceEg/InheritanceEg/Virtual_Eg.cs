using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InheritanceEg
{
    class Vehicle
    {
        public virtual void Characteristics()
        {
            Console.WriteLine("its a vehicle");
        }
        public void sample()
        {
            Console.WriteLine("non virtual method");
        }
    }
    class Car : Vehicle
    {
        public override void Characteristics()  //'new' keyword can be used instead of override
        {
            Console.WriteLine("its a car");
        }

    }

    class Virtual_Eg
    {
        static void Main()
        {
            Vehicle v = new Vehicle();
            Car c = new Car();
            v.Characteristics();
            v.sample();
            c.Characteristics();
            Console.Read();

        }
    }
}
