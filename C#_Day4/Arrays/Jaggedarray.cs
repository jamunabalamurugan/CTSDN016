using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WorkwithArrays
{
    class Jaggedarray
    {
        static void Main()
        {
            //Declaration of Jagged array
            int[][] j_array = new int[3][];
            j_array[0] = new int[4] { 3, 5, 7, 8 };
            j_array[1] = new int[3] { 34, 56, 78 };
            j_array[2] = new int[2] { 21, 32 };
            //length of jagged array
            Console.WriteLine(j_array.Length);
            foreach (int i in j_array[0])
            {
                Console.Write(i + "\t");

            }
            Console.WriteLine();
            foreach (int i in j_array[1])
            {
                Console.Write(i + "\t");

            }
            Console.WriteLine();
            foreach (int i in j_array[2])
            {
                Console.Write(i + "\t");

            }
            Console.Read();
        }
    }

}