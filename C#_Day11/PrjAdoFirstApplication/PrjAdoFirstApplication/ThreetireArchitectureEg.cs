using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace PrjAdoFirstApplication
{
    //Model Class
    class Student1
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int? Age { get; set; }
    }
    class DataAccessLayer
    {
        public static SqlConnection con = null;
        public static SqlCommand cmd = null;
        static string connection = ConfigurationManager.ConnectionStrings["dbStudycon"].ConnectionString;
        #region Connection
        public static SqlConnection GetConnection()
        {
            con = new SqlConnection(connection);
            con.Open();
            return con;
        }
        #endregion
        Student1 studentobj = new Student1();
        public int? GetAge(int sid)
        {
            con = GetConnection();
            cmd = new SqlCommand("select Age from  Students where id=@Stuid", con);
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.Add(new SqlParameter("@Stuid", sid));

            studentobj.Age =Convert.ToInt32(cmd.ExecuteScalar());
                       
            return studentobj.Age;
        }


    }

    class BusinessAccessLayer
    {
        DataAccessLayer Dalobj = new DataAccessLayer();
        Student1 studal=new Student1();
      public string CheckAge(int sid)
        {
            //  studal = Dalobj.GetAge( s);
            studal.Age = Dalobj.GetAge(sid);
            if (studal.Age!=null && studal.Age > 0)
            {
                return "Valid";
            }
            else
            {
                return ("Invalid");
            }
        }
        public string CheckPlacementAge(int sid)
        {
            //  studal = Dalobj.GetAge( s);
            studal.Age = Dalobj.GetAge(sid);
            if (studal.Age != null && studal.Age > 21)
            {
                return "Valid";
            }
            else
            {
                return ("Invalid");
            }
        }

        public string CheckVotingAge(int sid)
        {
            //  studal = Dalobj.GetAge( s);
            studal.Age = Dalobj.GetAge(sid);
            if (studal.Age != null && studal.Age > 18)
            {
                return "Valid";
            }
            else
            {
                return ("Invalid");
            }
        }


    }

    //Presentation Layer
    class ThreetireArchitectureEg
    {
        public static void Main()
        {
            
            BusinessAccessLayer balobj = new BusinessAccessLayer();
            Student1 student = new Student1();
            Console.WriteLine("Enter the student Id");
            student.Id = int.Parse(Console.ReadLine());
            string result = balobj.CheckPlacementAge(student.Id);
            Console.WriteLine( "The Students Age is {0 }",result);
            Console.WriteLine(student.Age);
            Console.Read();
        }
    }
}
