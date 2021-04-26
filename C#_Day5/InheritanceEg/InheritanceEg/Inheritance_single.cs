using System;
public class Calculation
{
    public int length, width;
    public void Calc(int l,int w)
    {
        length = l;
        width = w;
    }
}

public class Square : Calculation
{
    public int area()
    {
        int area1 = length * length;
        Console.WriteLine("Area of Square is {0}", area1);
        return area1;

    }

    public class Rectangle : Square
    {
        public int area21()
        {
            int area2 = length * width;
            Console.WriteLine("Area of Rectangle is {0}", area2);
            return area2;

        }

        public static void Main(string[] args)
        {
            Rectangle d1 = new Rectangle();
            
            d1.Calc(10, 20);
            d1.area();
            d1.area21();

            Console.Read();

        }
    }
}



