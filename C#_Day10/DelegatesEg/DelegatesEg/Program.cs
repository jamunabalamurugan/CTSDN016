using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DelegatesEg
{
    
        public delegate void SimpleDelegate();  //Declare a delegate....it can refer to the methods which have the same signature
 
        class MyDemo
        {

        public void MyFuncDay10()
            {
                Console.WriteLine("We have to learn DATABASE Connectivity...");
            }
        public void MyFuncDay11()
        {
            Console.WriteLine("We should learn Three Tier Architecture...");
        }
        public void MyFuncDay12()
        {
            Console.WriteLine("Hello");
        }
        public static void Main()
            {
            MyDemo md = new MyDemo();
            SimpleDelegate simpleDelegate = new SimpleDelegate(md.MyFuncDay10);//instatiate a Delegate...we need to assign the reference of the required method to the delegate Object


            simpleDelegate();//Use or Calling the delegate

            simpleDelegate = new SimpleDelegate(md.MyFuncDay11);  //Here the Delegate allows you to dynamically change the reference to the methods in a class
            
            simpleDelegate();//Indirect way of calling a method dynamically

            simpleDelegate = new SimpleDelegate(md.MyFuncDay12);

            simpleDelegate();

            Console.ReadKey();
            }
        }
}
   




