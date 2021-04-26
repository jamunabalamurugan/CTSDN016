using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesAndObjects
{
    class Dept
    {

       public int Deptid;
       public string DName;
       public static string Organizationname;
       int a;

        public void Display()
        {
            Console.WriteLine(Deptid+ " "+ DName+""+" "+ Organizationname);
        }
    }
    class Organization
    {
        public static void Sample()
        {

        }

        static void Main()
        {
            Dept d = new Dept();
            d.Deptid = 10;
            d.DName = "UX";
            Sample();
            //d.Organization = "Dfds";
            Dept.Organizationname = "CTS";
            d.Display();
            d.Deptid = 20;
            d.DName = "HR";
            d.Display();

            Console.Read();
           // d.Organization = "Dfds";
        }
    }
}
