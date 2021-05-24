using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFDemoSecond
{
    class LInqExamples
    {

        void Sum()
        {
            int[] numbers = { 2, 5, 10 };
            var result = numbers.Sum();
            Console.WriteLine(result);
        }
        void Names()
        {
            // Data source
            string[] names = { "Bill", "Steve", "James", "Mohan", "Kavin", "Kanav" };
            // LINQ Query 
            var myLinqQuery = from aa in names
                              where aa.Contains('a')
                              orderby aa descending
                              select aa;//Mohan,Kavin,Kanav,James
            var myLinqQuery2 = from n in names
                               where n.Contains('K')
                               select n;
            // Query execution
            foreach (var s in myLinqQuery)
                Console.Write(s + " ");
        }

        void Score()
        {
            // Specify the data source.
            int[] scores = new int[] { 97, 92, 81, 60 };

            // Define the query expression.
            var scoreQuery =
                from s in scores
                where s > 80
                select s;

            // Execute the query.
            foreach (int i in scoreQuery)
            {
                Console.Write(i + " ");
            }

        }
        void Divide()
        {
            int[] numbers = { 5, 6, 7, 20, 60, 10, 90, 40, 70, 35, 78, 98 };
            // Query Syntax 
            var numbersdivbyten = from divbyten in numbers
                                  where (divbyten % 20 == 0)
                                  select divbyten;
            Console.WriteLine("The numbers divisible by 20 are");
            foreach (int number in numbersdivbyten)
            {
                Console.WriteLine(number);
            }
            // Method Syntax
            Console.WriteLine("Using Method syntax");
            var s = numbers.Where(anynum => anynum % 20 == 0);
            foreach (int i in s)
            {
                Console.WriteLine(i);
            }
        }
        
        static void Main()
        {
            LInqExamples obj = new LInqExamples();
            obj.Divide();
            Console.ReadKey();
        }
    }
}
