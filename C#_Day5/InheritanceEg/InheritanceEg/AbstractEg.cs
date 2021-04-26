using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InheritanceEg
{
   abstract class RBI
    {
     public abstract  string HomeLoan();
    protected  internal  abstract void EduLoan();
        public void RBIMethod()
        {
            Console.WriteLine("RBI Non Abstract Method");
        }
    }

    class IndianBank : RBI

    {
        public override string HomeLoan()
        {
            return "9%";
        }
        protected internal override void EduLoan()
        {
            Console.WriteLine("5%");
        }

    }

    class SBI:RBI
    {
        public override string HomeLoan()
        {
            return "10%";
        }
        protected internal override void EduLoan()
        {
            Console.WriteLine("7%");
        }
    }

        class AbstractEg
    {
        static void Main()
        {
            // RBI r = new RBI();
            // IndianBank indianBank = new IndianBank();
            // indianBank.RBIMethod();
            //Console.WriteLine("IndianBankLoan :{0}", indianBank.HomeLoan());
            // SBI sBI = new SBI();
            // Console.WriteLine("SBIBankLoan :{0}", sBI.HomeLoan());
            // sBI.RBIMethod();
            RBI r = new IndianBank();
           
            Console.WriteLine("IndianBankLoan :{0}", r.HomeLoan());
            r.RBIMethod();
            r.EduLoan();
            r = new SBI();
            Console.WriteLine("SBIBankLoan :{0}", r.HomeLoan());

            r.EduLoan();

            Console.Read();

        }
    }
}
