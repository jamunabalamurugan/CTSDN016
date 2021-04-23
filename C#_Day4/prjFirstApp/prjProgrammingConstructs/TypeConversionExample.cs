using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prjProgrammingConstructs
{
    class TypeConversionExample
    {
       static void Main()
        {
            //int i = 10;
            //float j = i;//Implicit Conversion

            float j = 10.56f;
            double k = 78.23534;
            //int i =(int)j;//Type Casting of float to int is possible
            Console.WriteLine("Enter a Number");
            string str1 = Console.ReadLine();
            //int i = (int)str1;//We cannt do type casting of string to int...Error
            int i = Convert.ToInt32(str1);

            Console.WriteLine("Implicit Conversion");
            Console.WriteLine("The value of Integer Variable i is {0}", i);
            Console.WriteLine("The value of Float Variable j is {0}", j);
            Console.ReadKey();

            Console.WriteLine("Explicit Conversion");
            float f1 = 20.23f;
            Console.WriteLine("Enter a integer");

            i = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("The value of Integer Variable i is {0}", i);
            Console.WriteLine("The value of Float Variable f1 is {0}", f1);


            Console.WriteLine("Pls enter a Number to convert using TryParse");
            string str2 = Console.ReadLine();
            int result = 0;
            bool status = int.TryParse(str2, out result);

            if (status)
            {
                Console.WriteLine("Input format is Correct");
                Console.WriteLine("result is "+result);
            }
            else
            {
                Console.WriteLine("Input format is Incorrect");
                Console.WriteLine("result is " + result);
            }


            Console.ReadKey();


        }

    }
}
