using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WorkwithArrays
{
    class Array4
    {
        static void Main()
        {
            string[,] emp = { { "E0001", "David", "Teamleader" }, 
                            { "E0002", "Peter", "Programmer" } };
            string _empid;
            Console.WriteLine("Enter Employee Id");

            _empid = Console.ReadLine();
            int _flag = 0;
            for (int i = 0; i <= emp.GetUpperBound(0); i++)
            {
                if (_empid == emp[i, 0])
                {
                    Console.WriteLine("Empname= " + emp[i, 1]);
                    Console.WriteLine("Designation=" + emp[i, 2]);
                    _flag = 1;
                }
                
            }
            if (_flag == 0)
            {
                Console.WriteLine("Invalid Empid");
            }
            Console.Read();

        }
    }
}
