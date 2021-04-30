using FFC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DrawShapes
{
    //public class Draw
    //{
    //    protected string brushtype="Thin";
    //    public virtual void Erase()
    //    {
    //        Console.WriteLine("Cleaning the screen");
    //    }

    //}
    public abstract class DrawingObject//:Draw
    {
        public abstract void Draw();//It has no body or implementation...so its compulsory that the derive class must implement an abstract method
        public virtual void Photo() { Console.WriteLine("Hello...."); }

        //public void Scriblle()
        //{
        //    Console.WriteLine(brushtype);

        //}

    }

    sealed class Line : DrawingObject
    {
       public ZigZag z=new ZigZag();
        public override void Draw()//An abstract method should be implemented in its derived class
        {
            Console.WriteLine("I'm a Line.");
        }
        public sealed override void Photo()
        {
            Console.WriteLine("Photo is sealed withing Line Class");
        }
        public  class ZigZag //inner class
        {
            public  void Draw()
            {
                Console.WriteLine("ZigZag class used for free hand drawing");
            }
        }

    }
    //public class ZigzagLine : Line--Cannot inherit from Sealed class
   // {
        //public override void  Photo()-Not  puossibe to override a sealed method
        // {
       // Console.WriteLine("Inside the zigzag class Photo method");
        //}
    //}

    public class Circle : DrawingObject
    {
        public override void Draw()
        {
            Console.WriteLine("I'm a Circle.");
        }
        public override void Photo()
        {
            Console.WriteLine("Photo is not sealed within Circle Class");
        }

    }

    public class Square : DrawingObject
    {
        public override void Draw()
        {
            Console.WriteLine("I'm a Square.");
        }
        public  override void Photo()
        {
            Console.WriteLine("Photo is not sealed within Square Class");
        }

    }
    class SunBigCircle : Circle
    {
        public void Turn90()
        {
            Console.WriteLine("Rocking chair can turn 90 Degree");
        }
        public override void Photo()
        {
            Console.WriteLine("Inherited from Circle");
        }
    }

    public class DrawDemo
    {
        public static int Main(string[] args)
        {
            DrawingObject[] dObj = new DrawingObject[4];
           // DrawingObject obj = new DrawingObject();

            dObj[0] = new Line();
            dObj[1] = new Circle();
            dObj[2] = new Square();
            dObj[3] = new Line();

            foreach (DrawingObject drawObj in dObj)
            {
                drawObj.Draw();

            }
            Line nl = new Line();
            nl.z.Draw();
             //  Line.ZigZag.Draw();
            

            Console.ReadLine();
            return 0;

        }

    }

}
