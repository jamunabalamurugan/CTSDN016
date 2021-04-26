using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesAndObjects
{
    class AreaExample
    {
        
     public   int Area(int SquareArea)
        {
            return SquareArea * SquareArea;
        }
        
    public    int Area(int len, int bre)
        {
            return len * bre;
        }
    }
    class MethodOverloadingEg
    {
        static void Main()
        {
            AreaExample areaExample = new AreaExample();
           Console.WriteLine( areaExample.Area(10));
           Console.WriteLine( areaExample.Area(2, 4));
            Console.Read();
        }
    }
}
