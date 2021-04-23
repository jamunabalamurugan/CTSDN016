using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prjProgrammingConstructs
{
    class Program
    {
        static void Main(string[] args)
        {
            int choice=0;
            while (choice!=2)
            {
                Console.WriteLine("1.Enter your Details 2.Exit");
            
                choice = Convert.ToInt32(Console.ReadLine());
                switch(choice)
                {
                    case 1:
                        Console.WriteLine("Enter your Name");
                        string name = Console.ReadLine();
                        Console.WriteLine("Hello "+name+"Welcome to C#!!!");
                        break;
                    case 2:
                        Console.WriteLine("Exiting.....");
                        break;


                }


            };

        }
    }
}
