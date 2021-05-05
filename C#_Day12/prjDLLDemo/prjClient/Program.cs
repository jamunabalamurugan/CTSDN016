using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using prjDLLDemo;
namespace prjClient
{
    class Program
    {
        static void Main(string[] args)
        {
            string str;
            Console.WriteLine("Enter the card no");
            str = Console.ReadLine();

            Card card = new Card();
            if(card.Validate(str))
            {
                Console.WriteLine("Valid Card no");
            }
            else
                Console.WriteLine("Invalid Card no");


            Console.ReadKey();

        }
    }
}
