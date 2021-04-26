using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InheritanceEg
{

    class Student
    {
        int id;

        public int _Id
        {
            get { return id; }
            set { id = value; }
        }
        public string city;
        public string Name { get; private set; }
        public Student(string Name)
        {
            this.Name = Name;
        }

        void Display()
        {
            Console.WriteLine(Name.Length);
        }

    }

    
    class AccessorEg
    {
        static void Main()
        {
            Student student = new Student("Harini");
            student._Id = 123;
            Console.WriteLine(student._Id);
            Console.WriteLine(student.Name);
            Console.Read();
        }
    }
}
