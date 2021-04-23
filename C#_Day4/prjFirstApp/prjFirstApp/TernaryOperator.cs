using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prjFirstApp
{
    class DemoTernary
    {
        static void Main()
        {
            int num = 0;
            bool b;
            //if (num == 10)
            //{
            //    b = true;
            //}
            //else
            //{
            //    b = false;
            //}
             b = num >= 10 ? true : false;

             num = num == 0 ?  10 : num;

            Console.WriteLine("Is Number greater than 10 ?  {0}", b);
            Console.WriteLine("Number is {0}", num);
            Console.ReadKey();
        }
    }

    //can be replaced as

   

}
