using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace classAndObject
{
    class Student
    {
        int sid;
        string sname;
        Student(int id, string name)
        {
            sid = id;
            sname = name;
            Console.WriteLine("id:{0} && name:{1}", id, name);
        }
        static void Main()
        {
            Student[] s = new Student[4];
            for (int i = 0; i < 4; i++)
            {
                Console.WriteLine("enter the id");
                int id = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Enter the name");
                string name = Console.ReadLine();
                s[i] = new Student(id, name);
                Console.ReadLine();
            }
        }
    }
}