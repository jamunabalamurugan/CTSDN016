using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prjFirstApp
{
    class Student
    {
        //Structured Programming
        //Everyting within Main function
        public static void Main(string[] args)
        {
            //Declaring the variables
            string studName;
            int studAge;
            int studMarks = 90;

            Console.WriteLine("Enter your name");
            studName = Console.ReadLine();
            Console.WriteLine("Enter your age");
            studAge = Convert.ToInt32(Console.ReadLine());

            studMarks = Convert.ToInt32(Console.ReadLine());
            //Displaying the students detail
            Console.WriteLine("The students name is "+ studName + "and Age is "+studAge);
            //or
            Console.WriteLine("The student name is:{0} \t Age is {1}\t Marks is {2}",
                studName,studAge,studMarks);
            //Console.WriteLine("The student age is:{0}", studAge);
            Console.ReadKey();
        }
    }

}
   
