using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day3Project
{
    class Movie
    {
        public int Id { get; set; }
        public string Name { get; set; }

        int duration;
        string[] cast = new string[3];

        public string this[int index]
        {
            get { return cast[index]; }
            set { cast[index] = value; }
        }
        public int this[string name]
        {
            get
            {
                int idx = -1;
                for (int i = 0; i < cast.Length; i++)
                {
                    if (name == cast[i])
                        idx = i;
                }
                return idx;
            }
        }

        public Movie()
        {
            Id = 101;
            Name = "ABC";
            Console.WriteLine("Default constructor invoked");
        }
        public Movie(int id, string name)
        {
            Id = id;
            Name = name;
            Console.WriteLine("Parameterized constructor invoked");
        }
        public Movie(int id, string name, int duration)
        {
            Id = id;
            Name = name;
            this.duration = duration;//instance variable = parameter
            Console.WriteLine("Parameterized constructor invoked");
        }
        public static Movie operator +(Movie m1, Movie m2)
        {
            Movie m3 = new Movie();
            m3.Id = m1.Id + m2.Id;
            m3.Name = m1.Name + " " + m2.Name;
            return m3;
        }
        public void PrintMovie()
        {
            Console.WriteLine("Movie ID " + Id);
            Console.WriteLine("Movie Name " + Name);
            Console.WriteLine("The cast details are: ");
            foreach (var item in cast)
            {
                Console.WriteLine(item);
            }
        }
    }
}
