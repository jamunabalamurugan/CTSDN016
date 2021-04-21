using System;
    class Demo
    {
    //Console Application
    /// <summary>
    /// This function will Accept Name from user and Welcome the users
    /// It will be called automatically in the Main
    /// This will show the comments
    /// </summary>
    /// 
    static void Accept()
    {
        Console.WriteLine("Enter your Name");
        string name = Console.ReadLine();
        Console.WriteLine("Enter Age");
        int age = Convert.ToInt32(Console.ReadLine());

       // Console.WriteLine("Welcome to Csharp...."+ name + "!!!");
        Console.WriteLine("Welcome to CSharp {0} ....your age is {1}!!!",name,age);

    }
    static void Add()
    {
        int iNum1;//declaration
        iNum1 = 100;//assign value
        int iNum2 = 100;//declaration & initialization
        Console.WriteLine(iNum1);
        int iSum, iProd;//multiple variable declaration
        iSum = iNum1 + iNum2;
        iProd = iNum1 * iNum2;
        Console.WriteLine("The sum is " + iSum);//Concatenation
        Console.WriteLine("The product is {0}", iProd);
        //print with place holders
        Console.WriteLine("The sum of {0} and {1} is {2}", iNum1, iNum2, iSum);
    }

    static void Main()
        {
            Console.WriteLine("Hello ");
            Add();
            Console.ReadKey();
        }
    }

