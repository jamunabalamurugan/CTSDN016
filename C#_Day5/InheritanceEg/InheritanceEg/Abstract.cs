using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InheritanceEg
{
    abstract class RBI
    {
        public abstract string HomeLoan();

        public void RBIMethod()
        {
            Console.WriteLine("RBI NON ABSTRACT METHOD");
        }


        
    }
    class Indian : RBI
    {
        public override string HomeLoan()
        {
            return "10%";
        }
    }
    class SBI:RBI
    {
        public override string HomeLoan()
        {
            return "10%";
        }
    }
    class Abstract
    {
        static void Main()
        {
            //Indian ind = new Indian();
            //Console.WriteLine("indian bank home loan {0}", ind.HomeLoan());
            //SBI sb = new SBI();
            //Console.WriteLine("SBI bank homeloan {0}", sb.HomeLoan());
            //sb.RBIMethod();
            //ind.RBIMethod();
            //Console.Read();
            RBI r = new Indian();
            r.HomeLoan();
            r.RBIMethod();
            r = new SBI();
            r.HomeLoan();
            Console.Read();

        }
    }
}
