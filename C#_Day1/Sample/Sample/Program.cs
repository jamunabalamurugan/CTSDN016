using System;
    class Program
    {
         static void main()
         {
            Console.WriteLine("Hi from main function");
            Console.ReadKey();
         }
        static void Main()
        {
        // Console.WriteLine("Hello...Welcome to CSharp");
        // Console.ReadKey();
        //Console.WriteLine("Enter your name please:");
        //var name = Console.ReadLine();
        //Console.WriteLine("Welcome " + name +"!!!");
        //Console.ReadKey();
        Accept();  

        Display();
        Console.ReadKey();

        }
        static void Accept()
         {
        Console.WriteLine("Enter your name please:");
        var name = Console.ReadLine();
        var subject = "CSharp Basics";
        Console.WriteLine("Welcome {0} !!! You are learning {1}", name, subject);
         }
        static void Display()
        {
        Console.WriteLine("Thanks for using CSharp to develop console applications!!!");
        }
    }
