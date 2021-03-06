using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Chapter2_A1
{
    class ColorChange
    {
        string c1, c2;
        public void acceptDetails()
        {
            Console.WriteLine("Instructions:");
            Console.WriteLine("1. Please enter the two primary colors you want to add." + "\n2. The list of primary colors includes: \n RED \n GREEN \n BLUE");
            Console.WriteLine("3. Please enter the color in uppercase only.");
            Console.WriteLine("Please enter the first color:");
            c1 = Console.ReadLine();
            Console.WriteLine("Please enter the second color:");
            c2 = Console.ReadLine();
        }
        public void AddColors()
        {
            if ((c1 == "RED" && c2 == "GREEN") || (c1 == "GREEN" && c2 == "RED"))
            {
                Console.ForegroundColor = ConsoleColor.Yellow;
                Console.WriteLine("Yellow");
            }
            else if ((c1 == "RED" && c2 == "BLUE") || (c1 == "BLUE" && c2 == "RED"))
            {
                Console.ForegroundColor = ConsoleColor.Magenta;
                Console.WriteLine("Magenta");
            }
            else if ((c1 == "BLUE" && c2 == "GREEN") || (c1 == "GREEN" && c2 == "BLUE"))
            {

                Console.ForegroundColor = ConsoleColor.Cyan;
                Console.WriteLine("Cyan");
            }
            else
            {
                Console.WriteLine("Colors you entered are not the correct RGB color combination.");
            }
        }

        public static void Main()
        {
            ColorChange cC = new ColorChange();
            int choice = 1;
            do {
                cC.acceptDetails();
                cC.AddColors();
            }while(choice!=0);
            Console.ReadKey();
        }
    }

}
