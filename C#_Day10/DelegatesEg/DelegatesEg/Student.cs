using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DelegatesEg
{
    class Student:IComparable<Student>
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Student(int id,string name)
        {
            Id = id;
            Name = name;
        }
        public override string ToString()
        {
            return "Student Details "+ Id+" : " + Name;
        }

        public int CompareTo(Student other)
        {
            return this.Name.CompareTo(other.Name);
        }
    }
    class StudentProgram
    {
        public static void Main()
        {
            Student student1 = new Student(101,"Kavin");
            Student student2 = new Student(101, "Kavin");

            Console.WriteLine(student1);
            Console.WriteLine(student2);
            if(student1.Name==student2.Name && student1.Id==student2.Id)
            {
                Console.WriteLine("Both are equal");
            }
            else
            {
                Console.WriteLine("Bothe are not equal");
            }
            Console.ReadKey();

        }
    }
}
