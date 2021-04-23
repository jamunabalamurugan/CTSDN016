using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prjFirstApp
{
    class StrongTypes
    {

        // program to show C# is strongly typed

        static void Main()
        {
            float Num1= 10.5f;
            double Num2 = 11.8;
            int Num3 = 6;
            Num3 = Convert.ToInt32(Num1);//Explicit Conversion needed Cannot assign a float in to int
            Num3 = (int)Num2;//type casting --Might have data loss
            //Convert with status
            bool status = Int32.TryParse("1108", out Num3);
            if (status)
            {
                Console.WriteLine("Convert to int successful \t The Converted Num3 is {0}",Num3);
            }
            else
            {
                Console.WriteLine("Sorry....Could not convert");
            }

            Console.WriteLine("Num3 is {0} \t",Num3);
            Num1 = Num3;// Implicit converion --Can assign int to a float variable


            Console.WriteLine("Min value ={0}", int.MinValue);
            Console.WriteLine("Max value ={0}", int.MaxValue);
            Console.ReadKey();
        }
    }
}