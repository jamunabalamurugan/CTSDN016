using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day3Project
{
    public class ArithmeticOperation
    {
        public int add(int num1, int num2)
        {
            return num1+num2;
        }

        //Methods with same signature is not allowed even though its returning void here and int in above add methid
        //public void add(int a,int b)
        //{
        //    Console.WriteLine(a+b);
        //}
        public void add(float a, float b)
        {
            Console.WriteLine(a+b);
        }
        public void add(int a, float b)
                {
            Console.WriteLine(a+b);//
        }
        public void add(float a, int b)
                    {
            Console.WriteLine(a+b);//
        }
        public void add(int a, int b, int c)
        {//
            Console.WriteLine(a+b+c);
        }
        void Add(int num1, int num2)
        {
            Console.WriteLine("The sum is " + (num1 + num2));
        }
        void Add(int num1, int num2, int num3)
        {
            Console.WriteLine("The sum of 3 is " + (num1 + num2 + num3));
        }
        void Add(int num1, int num2, float num3)
        {
            Console.WriteLine("The sum of 3 with a float involved  is " + (num1 + num2 + num3));
        }
        void Add(int num1, float num3, int num2)
        {
            Console.WriteLine("The sum of 3 with a float involved inbetween  is " + (num1 + num2 + num3));
        }
        void Add(string num1, string num2)
        {
            Console.WriteLine("The result is " + (num1 + num2));
        }

    }
    class UseAdd
    {
        static void Main()
        {
            ArithmeticOperation obj = new ArithmeticOperation();
            //Method Overloading or Static Binding
            obj.add(5, 10);
            obj.add(3, 6, 9);
            obj.Add(99.7f, 87.5f);
            Console.WriteLine();
            Console.WriteLine("string \t overload\n");
            Console.ReadKey();
        }
    }
 }