using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day3Project
{
    internal class Cycle
    {
        string CycleBrand;
        public int Speed { get; set; }
        protected int Price { get; set; }
        public Cycle()
        {
            Speed = 10;
            Console.WriteLine("Cycle class Default constructor called");
        }

        public void Go()
        {
            Console.WriteLine("Helps us to move in speed "+Speed);
        }
        ~Cycle()
        {
            Console.WriteLine("Destructor of Cycle is called");
        }
    }
}
