using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DelegatesEg
{
    //Languange Integrated Query
    //https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/linq/query-syntax-and-method-syntax-in-linq
    class ExampleLINQ
    {
        void UnderstandingLINQ()
        {
            int[] scores = { 100, 80, 69, 56, 81, 74, 50 };
           // int[] TopScore = new int[scores.Length];
            int count = 0;
            //for (int i = 0; i < scores.Length; i++)
            //{
            //    if (scores[i] > 75)
            //    {
            //        TopScore[count] = scores[i];
            //        count++;
            //    }
            //}
            //Structured Query Language select s from collection/table 
            //Query Syntax
            IEnumerable<int> TopScores = from s in scores where s > 75 select s;//LINQ
            Console.WriteLine("Query Syntax Output");
            foreach (var item in TopScores)
            {
                Console.WriteLine(item);
            }
            //Method Syntax   
            Console.WriteLine("Method Syntax Output");
            var TopScores1 = scores.Where(mark => mark > 75);
            foreach (var item in TopScores1)
            {
                Console.WriteLine(item);
            }
        }
        void UsingLinqOrderBy()
        {
            int[] scores = { 100, 80, 69, 56, 81, 74, 50 };
            IEnumerable<int> TopScores = (from s in scores
                                         where s%2==0 
                                         orderby s
                                         select s);
            foreach (var item in TopScores)
            {
                Console.WriteLine(item);
            }
            var TopScores1 = scores.Where(mark => mark%2==0).OrderBy(mark=>mark);
            foreach (var item in TopScores1)
            {
                Console.WriteLine(item);
            }


        }

        void GroupByUsingLinq()
        {
            string[] fruits = { "apple", "orange", "apricot","orange","apple-Kashmir","apple-washington", "watermelon", "woodapple" };
            var q = from w in fruits
                    group w by w[0] into myfruits//{}
                    where myfruits.Count()>=2
                    select new
                    {
                        firstletter = myfruits.Key,
                        words = myfruits.Count()
                    };

            foreach (var item in q)
            {
                Console.WriteLine(item.firstletter+" Count is : "+item.words );
            }
        }
        void LinqEqualsEg()
        {
            string[] fruits = { "apple", "orange", "apricot", "orange", "apple-Kashmir", "apple-washington", "watermelon", "woodapple" };
            string str = "orange";
            var result = from fruit in fruits
                         where fruit.Equals(str)
                         select fruit;
            foreach (var item in result)
            {
                Console.WriteLine(item);
            }
        }    

        void LinqUsingList()
        {
            List<Student> students = new List<Student> { new Student(101,"Tarun"),
                                                           new Student(102,"Kanav"),
                                                           new Student(103,"Sumedha"),
                                                           new Student(104,"Aravindhan"),
                                                           new Student(105,"Kavin")
                                                        };
            Student student = students.Where(s => s.Id > 102).Max();
            Console.WriteLine(student);
            Console.WriteLine("--------------------------");
            var myStudents1 = students.Where(s => s.Name.Contains("i")).OrderBy(s => s.Name);
            foreach (Student student1 in myStudents1)
            {
                Console.WriteLine(student1);
            }
            Console.WriteLine("--------------------------");
            List<Student> myStudents2 = students.Where(s => s.Name.Contains("a")).OrderByDescending(s => s.Name).ToList();
            foreach (Student student1 in myStudents2)
            {
                Console.WriteLine(student1);
            }


            List<Student> myStudents3 = students.Where(s => s.Name.Contains("i")).OrderBy(s => s.Name).ThenBy(s => s.Id).ToList();
            foreach (Student student1 in myStudents3)
            {
                Console.WriteLine(student1);
            }
            Console.WriteLine("--------------------------");
            var myStudents4 = students.Where(s => s.Name.Contains("i")).OrderBy(s => s.Name)
                .Select(s => new {
                    ID = s.Id,
                    Name = s.Name.Substring(0, 2)
                });
            foreach (var item in myStudents4)
            {
                Console.WriteLine(item.ID + " "  + item.Name);
            }
            Console.WriteLine("--------------------------");
            var myStudents5 = students.GroupBy(s => s.Name);
            foreach (var item in myStudents5)
            {
                Console.WriteLine("The ids with the name " + item.Key);
                foreach (var id in item)
                {
                    Console.WriteLine(id);
                }
                Console.WriteLine("*********************");
            }

        }
        static void Main()

        {
            new ExampleLINQ().LinqUsingList();
            ExampleLINQ el = new ExampleLINQ();
          //  el.UnderstandingLINQ();

            Console.ReadKey();
        }
    }
}
