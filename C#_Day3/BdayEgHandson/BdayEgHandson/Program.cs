using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BdayEgHandson
{
    class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("Enter the letter found in the paper");
            string s = Console.ReadLine();
            TresureBox tb = new TresureBox();
            Parachute p = new Parachute();

            if (s=="T")
            {
                Console.WriteLine(tb.OpenSesame());
            }
            else if (s=="P")
            {
                Console.WriteLine(p.OpenSesame());
            }
            Console.ReadKey();
        }
    }

    public interface IOpenable
    {
        string OpenSesame();
    }
    public class TresureBox : IOpenable
    {
        private string s = "Congratulations , Here is your lucky win";
        public string OpenSesame()
        {
            return s;
        }
    }

    public class Parachute : IOpenable
    {
        private string s = "Have a thrilling experience flying in air";
        public string OpenSesame()
        {
            return s;
        }
    }
}
