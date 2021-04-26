using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesAndObjects
{
    class Student
    {
      public  int Studentid;
      public  string StudentName;
      public static string CollageName="MIT";
        
        public Student()
        {

        }
        public Student(int Studentid, string StudentName)
        {
            this.Studentid = Studentid;
            this.StudentName = StudentName;
        }
        public void DisplayDetails()
        {
            Console.WriteLine("Id:{0},Name:{1},CName{2}", Studentid, StudentName, CollageName);
        }

        public static void Data()
        {
            Console.WriteLine(CollageName);
        }
    }
    class StaticEg
    {
      static  int no;
      static  void Sample()
        {
            no = 100;
        }
        static void Main()
        {
            no = 23;
            int Sid;
            string SName;
            //string CName;
            //Student Sobj = new Student();
            //Sobj.Studentid = 12;
            //Sobj.StudentName = "sdsa";

            Sample();
            Student.Data();
            Student[] student = new Student[2];
            
            for (int i=0;i<2;i++)
            {
                Console.WriteLine("Enter sid ,sname");
                Sid = Convert.ToInt32(Console.ReadLine());
                SName = Console.ReadLine();
              //  CName = Console.ReadLine();
                student[i] = new Student(Sid, SName);
            }

            foreach( Student s in student)
            {
                s.DisplayDetails();
            }
           
            Console.ReadKey();
        }
    }
}
