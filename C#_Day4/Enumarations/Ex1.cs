using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace WorkwithEnumarations
{
    public enum Range : byte
    {
        Min=byte.MinValue, Max=byte.MaxValue

    };
    class Ex1
    {
        static void Main()
        {
           
            Console.WriteLine("value of {0} ={1}", Range.Min, (byte)Range.Min);
            Console.WriteLine("value of {0} ={1}", Range.Max, (byte)Range.Max);
            Console.Read();
        }
    }
}