using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day3Project
{
    class RacingMotorCycle:MotorCycle
    {
        public RacingMotorCycle()
        {
            Console.WriteLine("Racing Motor Cycle Default Constructor called");
           Speed = 100;

        }
        public void RaiseAndRace()
        {
            Console.WriteLine("Race is my thing");
        }
        ~RacingMotorCycle()
        {
            Speed = 0;
            Console.WriteLine("Destructor of RacingMotorCycle is called");
        }
    }
}
