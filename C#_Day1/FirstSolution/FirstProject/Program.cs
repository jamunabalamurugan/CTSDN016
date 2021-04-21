using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FirstProject
{
    class Program
    {
        static void Add()
        {
            int iNum1;//declaration
            iNum1 = 100;//assig value
            int iNum2 = 100;//declaration & initialization
            Console.WriteLine(iNum1);
            int iSum, iProd;//multiple variable declaration
            iSum = iNum1 + iNum2;
            iProd = iNum1 * iNum2;
            Console.WriteLine("The sum is "+iSum);//Concatenation
            Console.WriteLine("The product is {0}",iProd);
            //print with place holders
            Console.WriteLine("The sum of {0} and {1} is {2}",iNum1,iNum2,iSum);
        }

        static void PrintTheGreatestOfTwo()//Header
        {
            int iNum1, iNum2;
            iNum2 = 1000;
            iNum1 = 200;
            Console.WriteLine("User user please enter the first number");
          //  iNum1 = int.Parse(Console.ReadLine());
            int temp;
            

            //string var1 = Console.ReadLine();
            //bool result=int.TryParse(var1, out iNum1);
            //if(result==true)
            //    Console.WriteLine("The converted integer is s: {0}", iNum1);
            //else
            //    Console.WriteLine("Could not convert iNum1 to an integer");

            if (int.TryParse(Console.ReadLine(), out iNum1))
                Console.WriteLine("The converted integer is s: {0}",iNum1);
            else
                Console.WriteLine("Could not convert iNum1 to an integer");

            Console.WriteLine("Way to go... now please enter the Second number");
            iNum2 = int.Parse(Console.ReadLine());
            if (iNum1 == iNum2)
                Console.WriteLine("The numbers are equal");
            else if(iNum1>iNum2)
                Console.WriteLine("Num1 is greater");
            else
                Console.WriteLine("Num2 is greater");
        } 

        static void Calcualte()
        {
            int iNum1, iNum2;
            Console.WriteLine("User user please enter the first number");
            iNum1 = int.Parse(Console.ReadLine());
            Console.WriteLine("Way to go... now please enter the first number");
            iNum2 = int.Parse(Console.ReadLine());
            int iSum = iNum1 + iNum2;
            Console.WriteLine("The sum is "+iSum);
            int iSub = iNum1 - iNum2;
            Console.WriteLine("The subraction result is " + iSub);
            int iProd = iNum1 * iNum2;
            Console.WriteLine("The product is " + iProd);
            int iDiv = iNum1 / iNum2;
            Console.WriteLine("The division result " + iDiv);
        }
        static void DynamicCalculation()
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
                    int iDiv =0;
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
        static void UnderstandingWhileLoop()
        {
            int iCount = 10;
            while(iCount<=10)
            {
                Console.WriteLine(iCount);
                iCount++;
            }
        }
        static void UnderstandingDoWhileLoop()
        {
            int iCount = 10;
            do
            {
                Console.WriteLine(iCount);
                iCount++;
            } while (iCount<10);
        }
        static void UnderstandingForLoop()
        {
            //for(init;cond;upd)
            for (int i = 0; i < 10; i++)//i=i+1,i+=1
            {
                Console.WriteLine("i is {0} ++i is  {1} & i++ is {2} ",i,++i,i++);
            }
        }
        static void PrintTheSumOfGivenNumbers()
        {
            int iNum = 0,iSum = 0;
            do
            {
                Console.WriteLine("Please enter a number");
                iNum = int.Parse(Console.ReadLine());
                if (iNum > 0)
                    iSum = iSum + iNum;
            } while (iNum>0);
            Console.WriteLine("The sum is "+iSum);
        }
        //Normal comment
        //Main - reserved Identifier
        /// <summary>
        /// Documentation comment
        /// </summary>
        /// <param name="args"></param>
        static void Main(string[] args)
        {
            //Add();
            //Console.WriteLine("Hello World");
            //PrintTheGreatestOfTwo();

            //Calcualte();
            //DynamicCalculation();
            PrintTheGreatestOfTwo();
            //Calc.DynamicCalculation();
            //UnderstandingWhileLoop();
            //Console.WriteLine("-------------------------------------");
            //UnderstandingDoWhileLoop();
            //Console.WriteLine("-------------------------------------");
            //UnderstandingForLoop();
            //PrintTheSumOfGivenNumbers();
            Console.ReadKey();
        }
    }
}
