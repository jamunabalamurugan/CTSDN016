using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment
{
    class Student
    {
        int RollNo;
        string Name;
        string Class;
        string Sem;
        string Branch;
        int[] Marks = new int[5];

        //Method Declaration
        //Method Overloading

        //1. Method with return type with parameters
        //2. Method without return type with parameters
        //3. Method with return type without parameters
        //4. Method without return type without parameters

        //Methods should be Unique
        //We can have any number of Methods with same name but with different signature
        //Method signature is determined with the Datatype passed,no of arguments passed and the order in whcih it is passed

        public void AcceptStudent(int rollNo, string name=null, string myclass=null, string sem=null, string branch=null)
        {
            RollNo = rollNo;
            Name = name;
            Class = myclass;
            Sem = sem;
            Branch = branch;
        }
        public void AcceptStudent()
        {
           
        }
        public void AcceptStudent(int roll)
        {
            Console.WriteLine("Your roll no is {0}",roll);
        }

        public int AcceptStudent(int roll,float marks=10.5f)//Default value will be assigned only if the user is nor passing any value
        {
            Console.WriteLine("Hello your marks is :{0}", marks) ;
            return roll;
        }


        public void DisplayResult(int[] Marks)
        {
            for(int i = 0; i < 5; i++)
            {
                if (Marks[i] < 35 || Marks.Average() < 50)
                {
                    Console.WriteLine("Failed");

                }
                else if(Marks[i]>35 && Marks.Average()<50)
                    Console.WriteLine("Failed");
                else
                    Console.WriteLine("Pass");
            }
        }
        public void DisplayDetails()
        {
            Console.WriteLine("RollNumber"+RollNo+"Name"+Name+"Class"+Class+"Sem"+Sem+"Branch"+Branch);
        }

        static void Main()
        {
            //Student student = new Student(102,"Abi","A","First","CSE");

            Student student = new Student();
            student.AcceptStudent();
            student.AcceptStudent(10);
            student.AcceptStudent(10, 79.89f);

           // student.DisplayDetails();
           // student.DisplayResult(new int[] {20,90,40,80,100 });
            Console.ReadLine();
        }
    }
}
