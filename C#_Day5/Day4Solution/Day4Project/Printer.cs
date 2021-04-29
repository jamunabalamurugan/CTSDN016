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
        public int GetPid()//Member function
        {
            return pid;
        }
        public void SetPid(int id)
        {
            if(id>1000)
            pid = id;
            else
                Console.WriteLine("Invalid pid");
        }
        public int Pid //Property definition
        {
            get { return pid; }//Read Only
            set { pid = value; } //Write Only

        }

        //Auto implemented property
        // public double Price { get; } //Read only
        private int price;//This variable will not be changed as the Price property is Autoimplented
        public double Price  { get; set; }//Property can Read and Write Only is possible with Auto Implement

        private int noOfCatr;
        public int NoOfCatr { get => noOfCatr; set => noOfCatr = value * 10; }

        public Printer()
        {
            pid = 0;
            Pid = 0;
            price = 0;
            Price = 0;
            noOfCatr = 0;
            NoOfCatr = 0;
        }
        public int PrintDetails()
        {
            Console.WriteLine("The pid is {0} and Pid is {1} ", pid, Pid);
            Console.WriteLine("The price is {0} and Price is {1} ",price,Price);
            return noOfCatr;
        }
    }
    class Useprinter
    {
        static void Main()
        {
            Printer printobj = new Printer();
            printobj.SetPid(101);
            printobj.Pid = 1001;
            printobj.Price = 3599;
            printobj.NoOfCatr = 15;
            Console.WriteLine(printobj);
            Console.WriteLine(printobj.PrintDetails());
            Console.Read();
        }
    }
}
