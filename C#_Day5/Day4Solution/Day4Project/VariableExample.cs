using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day4Project
{
    class VariableExample
    {
        void TakeParameterByValue(int num1)
        {
            Console.WriteLine("The number received "+num1);
            num1++;
            Console.WriteLine("The number after increment inside the method " + num1);
        }
        void TakeParameterByRef(ref int num1)
        {
            Console.WriteLine("The number received " + num1);
            num1++;
            Console.WriteLine("The number after increment inside the method " + num1);
        }
        static void Main(string[] a)
        {
            int num = 100;
            VariableExample ve = new VariableExample();
            ve.TakeParameterByValue(num);
            Console.WriteLine("The number after the method call in the main " + num);

            
            ve.TakeParameterByRef(ref num);
            Console.WriteLine("The number after the method ref call in the main " + num);

            ve.TakeParameterByValue(num);
            Console.WriteLine("The number after the method call in the main " + num);
            Console.ReadKey();
        }
    }
}
