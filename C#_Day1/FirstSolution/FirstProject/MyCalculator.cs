using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FirstProject
{
    class Calc
    {
       public static void DynamicCalculation()
        {
            int iNum1, iNum2;
            Console.WriteLine("User user please enter the first number");
            iNum1 = int.Parse(Console.ReadLine());
            Console.WriteLine("Way to go... now please enter the first number");
            iNum2 = int.Parse(Console.ReadLine());
            string opr;
            Console.WriteLine("Please enter the symbol");
            opr = Console.ReadLine();
            switch (opr)
            {
                case "+":
                    int iSum = iNum1 + iNum2;
                    Console.WriteLine("The sum is " + iSum);
                    break;
                case "-":
                    int iSub = iNum1 - iNum2;
                    Console.WriteLine("The subraction result is " + iSub);
                    break;
                case "*":
                    int iProd = iNum1 * iNum2;
                    Console.WriteLine("The product is " + iProd);
                    break;
                case "/":
                    int iDiv = 0;
                    if (iNum2 != 0)
                    {
                        iDiv = iNum1 / iNum2;
                        Console.WriteLine("The division result " + iDiv);
                    }
                    else
                        Console.WriteLine("Cannot divide by zero");
                    break;
                default:
                    Console.WriteLine("Not a valid input");
                    break;
            }
        }
        static void Main()
        {
            DynamicCalculation();
            Console.ReadKey();
        }
    }
}
