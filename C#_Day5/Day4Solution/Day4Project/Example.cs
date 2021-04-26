using Day4Project;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day4Project
{
    public class Example
    {
        public static int iNumStatic = 10;
        int iNumInstance = 10;
        public Example()
        {
            iNumInstance++;
            iNumStatic++;
            Console.WriteLine("The constructor");
        }
        void PrintAll()
        {
            Console.WriteLine("Instance number value "+iNumInstance); 
            Console.WriteLine("Static number value " + iNumStatic);
        }
        ~Example()
        {
            Console.WriteLine("The Destructor");
        }
        public void InstanceMethod()
        {
            //StaticMethod();
            Console.WriteLine("Instance method");
        }
        public static void StaticMethod()
        {
            Example e1 = new Example();
            e1.InstanceMethod();
            Console.WriteLine("Static Method");
        }
        //static void Main(string[] a)
        //{
        //    Console.WriteLine(iNumStatic);
        //    //Console.WriteLine(iNumInstance);
        //    Console.WriteLine("From the Example Class");
        //    Example e1 = new Example();
        //    StaticMethod();
            
        //    //e1 = null;//removing the reff to the object
        //    //e1.InstanceMethod();
        //   // GC.Collect();
        //    Console.WriteLine("First Object");
        //    Example e2 = new Example();
        //    e2.PrintAll();
        //    Console.WriteLine("Second Object");
        //    Example e3 = new Example();
        //    e3.PrintAll();
        //    Console.ReadKey();
        //}
    }

    class UseExample
    {
        static void Main()
        {
            Example.StaticMethod();
            Example.iNumStatic = 100;
            Example e1 = new Example();
            e1.InstanceMethod();
        }
    }

}


