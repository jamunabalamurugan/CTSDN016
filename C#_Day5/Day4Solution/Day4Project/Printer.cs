using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day4Project
{
    class Printer
    {
        private int pid; //private member variable

        public int Pid //Property definition
        {
            get { return pid; }
            set { pid = value; } //Write Only

        }

        //Auto implemented property
        // public double Price { get; } //Read only
        private int price;//This variable will not be changes as the Price property is Autoimplented
        public double Price  { get; set; }//Property can Read and Write Only is possible with Auto Implement
        public int NoOfCatr { get => noOfCatr; set => noOfCatr = value*10; }

        private int noOfCatr;
        
        public int PrintDetails()
        {
            Console.WriteLine("The price is {0} ",Price);
            return noOfCatr;
        }
    }
    class Useprinter
    {
        static void Main()
        {
            Printer printobj = new Printer();
            printobj.Pid = 1001;
            printobj.Price = 3599;
            printobj.NoOfCatr = 15;
            Console.WriteLine(printobj);
            Console.WriteLine(printobj.PrintDetails());
            Console.Read();
        }
    }
}
