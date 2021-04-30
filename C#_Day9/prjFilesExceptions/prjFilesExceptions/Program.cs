using System;
using System.IO;
namespace prjFilesExceptions
{
    class Program
    {
      static void Main1()
        {
            try
            {
                StreamReader s = null;
                s = new StreamReader(@"e:\cts\MyFile.txt");
                Console.WriteLine(s.ReadToEnd());
                //char[] contents = new char[15];
                //contents = s.ReadToEnd().ToCharArray();
                //Console.WriteLine("The contents of array is {0}",contents.ToString());

                float f = 23.56f;
                int i = Convert.ToInt32(f);
                int j = 0;
                Console.WriteLine(i / j);//This will result in runtime error

                s.Close();
            }
            
            catch (FileNotFoundException obj)
            {
                Console.WriteLine("The file could not be found " + obj.Message);
            }
            catch (DirectoryNotFoundException obj)
            {
                Console.WriteLine("Pls check if directory  exists " + obj.Message);
            }
            catch (Exception obj)
            {
                Console.WriteLine(obj.Message);
                 Console.WriteLine(obj.StackTrace);

            }
            finally
            {
                Console.WriteLine("Pls close your files"); //Gets executed whether there is an exception or not
            }
            Console.WriteLine("End of Program");//This line is called after try block whether an exception occured or not
            Console.ReadKey();
        }
        static void Main(string[] args)
        {
            Main1();
            Console.ReadKey();
            //StreamReader sr = null;
            //Exception Handling
            //try
            //{
            //    //float f = 23.56f;
            //    //int i = Convert.ToInt32(f);
            //    //int j = 1;
            //    //Console.WriteLine(i / j);//This will result in runtime error

            //    sr = new StreamReader(@"e:\cts016\MyFile.txt");
            //    Console.WriteLine("The contents of the file :");
            //    Console.WriteLine(sr.ReadToEnd());


            //}
            //catch (DivideByZeroException d)
            //{
            //    Console.WriteLine("Pls check if your number is zero....");
            //}

            //catch (OverflowException obj)
            //{
            //    Console.WriteLine("Please enter a smaller no");
            //}
            //catch (FormatException obj)
            //{
            //    Console.WriteLine("The entered No {0} is incorrect", obj.HResult);
            //}
            //catch (FileNotFoundException obj)
            //{
            //    Console.WriteLine("The file could not be found "+obj.Message);
            //}
            //catch (DirectoryNotFoundException obj)
            //{
            //    Console.WriteLine("Pls check if directory  exists "+obj.Message);
            //}
            //catch (Exception obj)
            //{
            //    Console.WriteLine(obj.Message);
            //    // Console.WriteLine(e.StackTrace);

            //}

            //finally
            //{
            //    if (sr != null)
            //        sr.Close();
            //    Console.WriteLine("Inside Finally Block");
            //}
            //Console.WriteLine("After Reading the file");
            //Console.WriteLine("After the Try Catch Finally");
            Console.ReadKey();
        }
    }
}
