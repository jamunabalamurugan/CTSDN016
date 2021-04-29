using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day3Project
{
    class MotorCycle : Cycle
    {
        public MotorCycle()
        {
            
            Speed = 60;//Public
            Price = 10000;//Protected
            Console.WriteLine("MotorCycle Default Constructor is called");
        }
        public void ChangeGear()
        {
            Console.WriteLine("CHange gear to change speed");
        }
        ~MotorCycle()
        {
            Console.WriteLine("Destructor of MotorCycle is called");
        }
    }
}
