using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
namespace StudentDALEg
{
    public class Student1
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int? Age { get; set; }
    }
    public class DataAccessLayer
    {
        public static SqlConnection con = null;
        public static SqlCommand cmd = null;
        static string connection;
        public DataAccessLayer(string mystudycon)
        {
                    connection=mystudycon;
        }
        #region Connection
        public static SqlConnection GetConnection()
        {
         //   con = new SqlConnection("Data Source=MSBEEYS\\HBSQLEXPRESS;Initial Catalog=dbStudy;User ID=sa;Password=newuser123#");
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
            //cmd.CommandType = CommandType.Text;

            cmd.Parameters.Add(new SqlParameter("@Stuid", sid));

            studentobj.Age = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            return studentobj.Age;
        }
        public List<Student1> GetStudents()
        {
            List<Student1> students=new List<Student1>();
            students = new List<Student1>();
            SqlCommand cmdGetStudents = new SqlCommand();
            try
            {
                cmdGetStudents = new SqlCommand();
                cmdGetStudents.CommandText = "select * from Students";
                cmdGetStudents.Connection = con;
                con.Open();
                SqlDataReader drStudents = cmdGetStudents.ExecuteReader();
                Student1 student;
                while (drStudents.Read())
                {
                    student = new Student1();
                    student.Id = Convert.ToInt32(drStudents[0]);
                    student.Name = drStudents[1].ToString();
                    //int age;
                    //Int32.TryParse(drStudents[2].ToString(), out age);
                    //student.Age = age;
                    try
                    {
                        student.Age = Convert.ToInt32(drStudents[2]);
                    }
                    catch (InvalidCastException ice)
                    {
                    }
                    students.Add(student);
                }
            }
            catch (SqlException se)
            {
                Console.WriteLine(se.Message);
                Console.WriteLine("-------------------");
                Console.WriteLine(se.StackTrace);
            }
            finally
            {
                con.Close();
            }

            return students;
        }

    }
}