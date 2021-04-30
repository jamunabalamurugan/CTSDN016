using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InheritanceEg2
{
   public class InterviewRound1
    {
      public virtual string Result()//Function Overriding 
        {
            return "R1-Cleared";
        }
       

    }

    class Round2: InterviewRound1
    {
       

        public override string Result()//Function Overriding ...method has the same name and signature
        {
            base.Result();
            return "R2-Cleared";
        }
        
    }
    class Round3 : Round2
    {
        public override string Result()
        {
            return "R3-Cleared";
        }
    }

    class Round4: InterviewRound1
    {
        public new string Result()
        {
            return "R4-Cleared";
        }
       
    }
    class VirtualEg
    {
        static void Main()
        {
            InterviewRound1 r1 = new InterviewRound1() ;

            Console.WriteLine(r1.Result());
             r1 = new Round2();
              Console.WriteLine(r1.Result());
            r1 = new Round3();
             Console.WriteLine(r1.Result());
            r1 = new Round4();
            Console.WriteLine(r1.Result());


           // Round4 r4 = new InterviewRound1();--Wrong Only parent class object can be used to instatiate any of its derived classes
           // Console.WriteLine(r4.Result());
            Console.WriteLine(new Round4().Result());
            Console.Read();

        }
    }
}
