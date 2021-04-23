using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WorkwithArrays
{
    class Multidimension
    {
        static void Main()
        {
            //Declaration
            int[,] a = new int[2, 3] { { 2, 5, 7 }, { 4, 8, 3 } };
            //lenght of the array
            Console.WriteLine("Lenght= " + a.Length);
            //rank of the array
            Console.WriteLine("Rank= " + a.Rank);
            Console.WriteLine();
            foreach (int i in a)
            {
                Console.Write(i + "\t");
            }
            Console.WriteLine();
           
            //Returns max rowindex
            Console.WriteLine(a.GetUpperBound(0));
            //Returns max column index
            Console.WriteLine(a.GetUpperBound(1));
            //Display in Multiple rows and columns
            Console.WriteLine("\n");
            for (int i = 0; i <= a.GetUpperBound(0); i++)
            {
                for (int j = 0; j <= a.GetUpperBound(1); j++)
                {
                    Console.Write(a[i,j]+"\t");
                }
                Console.WriteLine();
            }
            Console.Read();
        }

   
    }
}
