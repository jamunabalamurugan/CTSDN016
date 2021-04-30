using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InheritanceEg2
{
    interface VechileInfo
    {
    void TypeofVechile();
    string VechileName();
    }

    interface OwnerInfo
    {
        void OwnerDetails();
        string VechileName();

    }
    class Alto: VechileInfo,OwnerInfo
    {
        string color = "RED";
        int noofseats = 4;
     public  void TypeofVechile()
        {
            Console.WriteLine(color + " "+ noofseats+ " "+"4- wheeler");
        }
     string VechileInfo.VechileName()
        {
            return " ALTO 800";
        }

      public  void OwnerDetails()
        {
            Console.WriteLine("Suman  from chennai");
        }
        string OwnerInfo.VechileName()
        {
            return "BMW";
        }
    }
    class VechileInterface
    {
        static void Main()
        {
            Alto alto = new Alto();
            alto.TypeofVechile();
            alto.OwnerDetails();
         //   VechileInfo vobj = new Alto(); //vechile Info
          
           Console.WriteLine(((VechileInfo)alto).VechileName());

          //  OwnerInfo oobj = new Alto();

            //Type Casting
            Console.WriteLine(((OwnerInfo)alto).VechileName()); 
            Console.Read();
        }
    }
}
