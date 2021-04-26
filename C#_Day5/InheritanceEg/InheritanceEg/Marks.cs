using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InheritanceEg
{
    class Student1
    {
        int id;
        public int _Id
        {
            get { return id; }
            set { id = value; }
        }

    }
    class Marks 
    {
        static void Main()
        {
            Student1 stud = new Student1();
            stud._Id = 124;
            Console.WriteLine(stud._Id);
            Console.Read();
        }
    }
}
