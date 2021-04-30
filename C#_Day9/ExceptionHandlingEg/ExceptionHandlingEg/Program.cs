using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExceptionHandlingEg
{
    class Program
    {
        public void MaxValue()
        {
            try
            {
                int i = int.MaxValue;
                i++;

                Console.WriteLine("Max value {0},Min valu {1},incremented value {2}", int.MaxValue, int.MinValue, i);
                i = int.MaxValue;
                checked
                {
                    i++;//This line will cause an exception when it exceeds its maximum value
                }
            }
            catch(OverflowException oe)
            {
                Console.WriteLine("sorry you have reached max value for an integer "+oe.Message);
            }
            catch(Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }
        public void CalculateSum()
        {
            int sum = 0;
            int[] number = new int[5] { 1, 2, 3, 4, 5 };

            try
            {
                for (int init = 1; init <= 5; init++)
                {
                    sum = sum + number[init];
                }
               
                Console.WriteLine("The sum of the array is : {0}", sum);
            }


            catch (IndexOutOfRangeException ie)
            {
                Console.WriteLine(ie.Message);
            }
            catch(Exception e)
            {
                Console.WriteLine("Exception Base : "+e.Message);
            }
        }
    
      static void Main(string[] args)
        {
        Program obj = new Program();
       // obj.CalculateSum();
            obj.MaxValue();
        Console.ReadKey();
         }
    }
}
