using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InheritanceEg
{
    class Exception_eg
    {
        //public int value = 10;
        public static void Main()
        {
            int number,value=10;
            void GetData()
            {
                Console.WriteLine("enter the number");
                number = Convert.ToInt32(Console.ReadLine());


            }
            void calculate()
            {
                try
                {
                    value = value / number;
                }
                catch (Exception ex)
                {
                    Console.WriteLine("error occured is {0}", ex);
                }
                Console.Read();
            }
        }
    }
}
        //// number=Convert.ToInt32(Console.ReadLine());
        

