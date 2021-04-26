using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InheritanceEg
{
    class Fx_Calci:BasicCalculator
    {
        public int add(int x,int y)
        {
            return x + y;
        }
        public int sub(int x, int y)
        {
            return x + y;
        }
        
        public int div(int x, int y)
        {
            return x + y;
        }
    }
    class Ex_Calci:BasicCalculator,Calculator
    {
        int BasicCalculator.add(int x, int y)
        {
            return x + y;
        }
        int BasicCalculator.sub(int x, int y)
        {
            return x + y;
        }

        int BasicCalculator.div(int x, int y)
        {
            return x + y;
        }
        public int mul(int x,int y)
        {
            return x * y;
        }
        int Calculator.div(int val1, int val2)
        {
            return val1 / val2;
        }
    }

    class operations
    {
        static void Main()
        {


            BasicCalculator bc = new Ex_Calci();
            Calculator c = new Ex_Calci();
            Console.WriteLine("add {0}", bc.add(10, 20));

            Console.WriteLine("sub {0}", bc.sub(100, 20));

            Console.WriteLine("div {0}", bc.div(100, 20));

            Console.WriteLine("mul {0}", c.mul(10, 20));

            Console.WriteLine("div {0}", c.div(100, 20));
           // bc = new Fx_Calci();
            Console.Read();

        }

    }
}
