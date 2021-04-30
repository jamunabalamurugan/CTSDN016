using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InheritanceEg2
{
    abstract class RBI
    {
        public abstract int HomeLoan();
        // public abstract void JobSeeker();

        internal string NewAnnouncement()
        {
            return "I am a non abstract method of RBI class";

        }

    }

    class Indian : RBI
    {
        public override int HomeLoan()
        {
            return 8;
        }
        // public abstract  override void JobSeeker();

    }

    class HDFC : RBI
    {
        public override int HomeLoan()
        {
            return 9;
        }

    }
    class AbstractEg
    {
        static void Main()
        {

            RBI robj;//Declare one abstract base class variable  


            //if choice is 1 then instatiate it with IndianBank child class & go for Homeloan with India Bank;
            robj= new Indian();

            Console.WriteLine(  robj.NewAnnouncement());//RBI
            Console.WriteLine(   robj.HomeLoan());//Indian bank


            robj = new HDFC();
            Console.WriteLine(robj.NewAnnouncement());//RBI
            Console.WriteLine(robj.HomeLoan());//HDFC 
            Console.ReadKey();
        }
    }
}
