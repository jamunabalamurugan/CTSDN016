using Day3Project;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day4Project
{
    internal class Road
    {
        void AddVehicle()
        {
            Cycle bsa = new Cycle();
            bsa.Go();
           
            MotorCycle re = new MotorCycle();//It calls the base clss default constructor
            re.Go();
            re.ChangeGear();
            RacingMotorCycle bmw = new RacingMotorCycle();//This class implements Multilevel Inheritance
            bmw.Go();
            bmw.ChangeGear();
            bmw.RaiseAndRace();

            bmw = null;

            re = null;

            bsa = null;

            GC.Collect();
            //bmw.ChangeGear();
            //bmw.Go();
        }
        static void Main(string[] a)
        {
            Road nh45 = new Road();
            nh45.AddVehicle();
            Console.ReadKey();
        }
    }
}
