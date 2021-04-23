using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WorkwithArrays
{
    class SingleDimension
    {
        public static void Main()
        {
            //Declaration array
            int[] a = new int[5] { 23, 45, 10, 35, 12 };
           // a[0] = 23;
            //a[1] = 45;
            //length of the array
            Console.WriteLine("Lenght of the array= " + a.Length);
            //Rank of the array
            Console.WriteLine("Rank of the array= " + a.Rank);
            //Dispaly array elements using for loop
            for (int i = 0; i < a.Length; i++)
            {
                Console.Write(a[i] + "\t");
            }
            //Display array elements using foreach
            Console.WriteLine();
            foreach (int k in a)
            {
                Console.Write(k + "\t");
            }
            //Reverse array elements
            Console.WriteLine("\nReverse array elements");
            System.Array.Reverse(a);
            foreach (int k in a)
            {
                Console.Write(k + "\t");
            }
            //sort array elements
            Console.WriteLine("\nsort array elements");
            System.Array.Sort(a);
            foreach (int k in a)
            {
                Console.Write(k + "\t");
            }
            int[] b = new int[6];
            //Apply copy()
            System.Array.Copy(a, b, 3);
            foreach (int k in b)
            {
                Console.WriteLine(k);
            }
            //apply clear()
            Console.WriteLine("\n");
            System.Array.Clear(a, 1, 2);
            foreach (int k in a)
            {
                Console.WriteLine(k);
            }
            Console.Read();
        }
    }
}
