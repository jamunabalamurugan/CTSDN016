using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProtectedInternalEg;
namespace ConsoleApp1
{
    class Program:AnimalEg
    {
        internal void WelcomeNew()
        {
            Console.WriteLine("Welcome New");
        }
        static void Main(string[] args)
        {
            Program p = new Program();
            
            p.AnimalName();
            
            p.WelcomeNew();
           
        }
    }
}
