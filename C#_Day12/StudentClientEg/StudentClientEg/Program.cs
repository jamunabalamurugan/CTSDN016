using StudentBusinessLogicEg;
//using StudentDALEg;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudentClientEg
{
    class ThreetireArchitectureEg
    {
        public static void Main()
        {
            string mystudycon = ConfigurationManager.ConnectionStrings["dbStudycon"].ConnectionString;
            BusinessLogicLayer balobj = new BusinessLogicLayer(mystudycon);
            //Student1 student = new Student1();
            Console.WriteLine("Enter the student Id");
            //student.Id = int.Parse(Console.ReadLine());
            int id= int.Parse(Console.ReadLine());
            //string result = balobj.CheckPlacementAge(student.Id);
            string result = balobj.CheckPlacementAge(id);
            Console.WriteLine("The Students Age is {0 }", result);
            //Console.WriteLine("The age is {0}",student.Age);
            var students = balobj.GetAllStudents();
            foreach (var item in students)
            {
                Console.WriteLine(item.Id);
            }
            Console.Read();
        }
    }
}
