using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prjFirstApp
{
    class Car
    {
        //Member Variables
        string engine;
        int wheels;
        //Member Functions
        public void GetCarDetails()
        {
            Console.WriteLine("Enter The Engine Details");
            engine = Console.ReadLine();
            Console.WriteLine("Enter the no of wheels");
            wheels = Convert.ToInt32(Console.ReadLine());
     

        }
        public void DisplayCarDetails()
        {
            Console.WriteLine("The Engine name is {0} and No of Wheels is {1}",engine,wheels);
            //Console.WriteLine(wheels);

        }

    }

    //class SecondProgram
    //{
    //    static void Main()
    //    {
    //        Car mycar = new Car();
    //        mycar.GetCarDetails();
    //        Console.WriteLine("Thanks for choosing us for your new Car!!!");
    //        mycar.DisplayCarDetails();
    //        Console.ReadKey();
    //    }
    //}
}
