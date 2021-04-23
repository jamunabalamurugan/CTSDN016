using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WorkwithStrings
{
    class Mutablestrings
    {
        static void Main()
        {
            StringBuilder _sb = new StringBuilder();
            _sb.Append("welcome ");
            _sb.Append("to ");
            _sb.Append("Hcl ");
            _sb.Append("Technolgies Chennai");
            _sb.AppendFormat("{0:C}", 1200);
          
            Console.WriteLine(_sb);
            //convert stringbuilder into string
            string s = _sb.ToString();
            Console.WriteLine(s);
            StringBuilder sb1 = new StringBuilder();
            object i=123;
            sb1.AppendFormat("{0:C}", i);
            Console.WriteLine(sb1);
            Console.Read();
        }
    }
}
