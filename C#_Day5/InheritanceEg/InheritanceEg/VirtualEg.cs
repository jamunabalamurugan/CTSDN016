using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InheritanceEg
{
    class Vehicle
    {
     public  virtual void  Characteristic()
        {
            Console.WriteLine("It has Wheel,Engine and Battery ");
        }

            }

    class Car:Vehicle
    {
       public void Test()
        {
            Console.WriteLine("Test");
        }
       public new void Characteristic()
        {
            Console.WriteLine("It has 4 -Wheel,1-Engine and 1- Battery ");
        }
    }

    class Cycle:Vehicle
    {
        public override void Characteristic()
        {
            Console.WriteLine("It has 2 -Wheel,0-Engine and 0- Battery ");
        }
    }
    class VirtualEg
    {
        static void Main()
        {
            Vehicle vehicle = new Vehicle();
            vehicle.Characteristic();

            Car car = new Car();
            car.Characteristic();
            car.Test();

            Cycle cycle = new Cycle();
            cycle.Characteristic();


            //Vehicle vehicle = new Vehicle();
            //vehicle.Characteristic();

            //vehicle = new Car();
            //vehicle.Characteristic();
          
            //vehicle = new Cycle();
            //vehicle.Characteristic();


            Console.Read();
        }
    }
}
