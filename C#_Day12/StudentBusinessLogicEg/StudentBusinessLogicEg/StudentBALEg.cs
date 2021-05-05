using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StudentDALEg;
namespace StudentBusinessLogicEg
{
    public class BusinessLogicLayer
    {
        DataAccessLayer Dalobj;
        Student1 studal = new Student1();

        public BusinessLogicLayer(string mystudycon)
        {
            Dalobj = new DataAccessLayer(mystudycon);
        }
        public string CheckAge(int sid)
        {
            //  studal = Dalobj.GetAge( s);
            studal.Age = Dalobj.GetAge(sid);
            if (studal.Age != null && studal.Age > 0)
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
        public List<Student1> GetAllStudents()
        {
            return Dalobj.GetStudents();
        }

    }
}

