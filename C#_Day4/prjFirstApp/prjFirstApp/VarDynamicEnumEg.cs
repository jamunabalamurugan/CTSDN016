using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prjFirstApp
{
    class VarDynamicEnumEg
    {
        // implicitly typed variables

        static void Main()
        {
            int i = 10;
            float f = 20.67f;
            int j;
            var a=f;
            var x = i;//see the type
            var y = 20.67f;  // now it is float
            var z = "AAA"; // becomes a string;



            dynamic d;
          
            d = 10;
            d = 456.67f;
            d = true;
            d = "AAA";
            Console.WriteLine(d);
        }



    }
}
