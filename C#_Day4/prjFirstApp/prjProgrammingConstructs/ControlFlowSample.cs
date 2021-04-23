using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prjProgrammingConstructs
{
    class ControlFlowSample
    {
        void CountVowels(string word)
        {
            int iCount = 0;
            //for (int i = 0; i < word.Length; i++)
            //{
            //    if (word[i] == 'a' || word[i] == 'e' || word[i] == 'i' || word[i] == 'o' || word[i] == 'u')
            //    {
            //        iCount++;
            //    }
            //}
            //i=i+1;
            for (int i = 0; i < word.Length; i++)
            {
                switch(word[i])//word[0]=H...word[1]=E...word[2]=L...word[3]=L...word[4]=O.....word.Length=5
                {
                    case 'a':
                    case 'A':
                    case 'e':
                    case 'E':
                    case 'i':
                    case 'I':
                    case 'o':
                    case 'O':
                    case 'u':
                    case 'U':
                        iCount++;
                    break;
                }
            }



            Console.WriteLine("The no of vowels is"+iCount);
        }
        static void Main()
        {
            ControlFlowSample sample = new ControlFlowSample();
            Console.WriteLine("Please enter a word");
            //We can call the Console.Readline function directly also
            //string str;
            //str = Console.ReadLine();
            //sample.CountVowels(str);
            //or
            sample.CountVowels(Console.ReadLine());
            Console.ReadKey();
        }
    }
}
