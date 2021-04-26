using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PropertyEg
{
    class Program
    {
        static void Main(string[] args)
        {
            Employee empobj;//Object Declaration
            
            empobj= new Employee();//Initialising the object

            Console.WriteLine("After object is initialized employee no is: {0}",empobj.EmployeeNo); //get property Accesor-Reading

            // empobj.eno = 71;
            empobj.EmployeeNo = 71;//set property Mutator-for writing
            Console.WriteLine("After object call the set Mutator employee no is: {0}",empobj.EmployeeNo); //get property Accesor

            empobj.EmployeeNo = 121;//set property Mutator-for writing
            Console.WriteLine("After object call the set Mutator employee no is: {0}", empobj.EmployeeNo);
            Console.Read();

        }
    }
}
