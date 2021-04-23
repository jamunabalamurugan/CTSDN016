using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WorkwithArrays
{
    class Array1
    {
        static void Main()
        {
            int _size;
            Console.WriteLine("Enter array size");
            _size = int.Parse(Console.ReadLine());
            int[] a = new int[_size];
            for (int i = 0; i < a.Length; i++)
            {
                Console.WriteLine("enter a[" + i + "] value");
                a[i] = int.Parse(Console.ReadLine());
            }
           //Max
            int _max;
            _max = a[0];
            foreach (int k in a)
            {
                if (_max < k)
                {
                    _max = k;
                }
            }
            Console.WriteLine("Maximum value =" + _max);
            Console.Read();
        }
    }
}
