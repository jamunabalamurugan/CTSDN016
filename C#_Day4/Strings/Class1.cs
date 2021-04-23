using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WorkwithStrings
{
    class Class1
    {
        static void Main()
        {
            //Console.WriteLine("enter any string");
            //string s1 = Console.ReadLine();
            //string s2 = null;
            //for (int i = 0; i < s1.Length; i++)
            //{
            //    if (s1[i] == ' ')
            //    {
            //        s2 += "_";
            //    }
            //    else
            //    {
            //        s2 += s1[i];
            //    }
            //}
            //char[] ch = new char[s1.Length];
            //for (int i = 0; i < ch.Length; i++)
            //{
            //    if (s1[i] == ' ')
            //    {
            //        ch[i] = '_';
            //    }
            //    else
            //    {
            //        ch[i]= s1[i];
            //    }
            //}
            ////converting char array to string
            //string _result = new string(ch);
            //Console.WriteLine(ch);
            //Console.WriteLine(s2);
            //Console.WriteLine(_result);
            ////convert string to char array
           // string s1 = "welcome to hcl";
           // //ToCharArray() convets string to given char array
           // char[] c1 = s1.ToCharArray();
           // foreach (char c in c1)
           // {
           //     Console.Write(c);
           // }
           ////split
           // Console.WriteLine();
           // string s2 = "C#.net,vb.net asp.net";
           // string[] s = s2.Split(',',' ');
           // foreach (string k in s)
           // {
           //     Console.WriteLine(k);
           // }
            //join
            string[] s1 = { "c#.net", "vb.net", "asp.net" };
            string s = string.Join(" ", s1);
            bool _result = s1.Contains("vb.net");
            Console.WriteLine(_result);
            Console.WriteLine(s);
            //Replace
            s = s.Replace(' ', '_');
            Console.WriteLine(s);
            s = s.Replace("asp.net", "sql server");
            Console.WriteLine(s);
            //substring
            string s3 = "PNR10033453CHE";
            s3 = s3.Substring(3,8);
            Console.WriteLine(s3);
            //format string
            double d = 1200;
            Console.WriteLine(string.Format("{0:C}",d));
           
          
            Console.Read();
        }
    }
}
