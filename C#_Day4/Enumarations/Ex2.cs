using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WorkwithEnumarations
{
    public enum Errmsg
    {
        LoginSuccess=1,
        LoginFialed=0

    };
    class Ex2
    {
        public Errmsg Validate(string uname,string pwd)
        {
            if (uname == "David" && pwd == "12345")
            {
               
                return Errmsg.LoginSuccess;
            }
            else
            {
                return Errmsg.LoginFialed;
            }
        }
        static void Main()
        {
            Ex2 ob = new Ex2();
            Errmsg ob1;
             ob1= ob.Validate("David", "12345");
             Console.WriteLine(ob1);
             Console.Read();
        }
    }
}
