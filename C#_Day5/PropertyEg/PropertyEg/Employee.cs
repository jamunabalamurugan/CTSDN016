using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PropertyEg
{
    class Employee
    {
        private int eno;//Private member variable

        public Employee()
        {
            eno = 100;
        }

        public int  GetEmpNo()
        {
            return eno;
        }
        public int EmployeeNo //property definition
        {
            get { return eno; } //accessor
        //  set { eno = value; } //Mutator


            set
            {
                if (value > 100 )
                {
                    eno = 0;
                    Console.WriteLine("Employee No should be in the range 0-100 only");
                }
                else
                {
                    eno = value;
                }
            }//Mutator
        }
    }
}
