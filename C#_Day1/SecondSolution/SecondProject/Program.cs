

using System;

namespace SecondProject
{
    class Program
    {
        static void CalculateTotalAmount()
        {
            float amount=0f,tax=0f, netAmount = 0f;
            Console.WriteLine("Please enter the amount");
            amount = float.Parse(Console.ReadLine());
            Console.WriteLine("Please enter the tax %");
            tax = float.Parse(Console.ReadLine());
            netAmount = amount + (amount * tax / 100);
            Console.WriteLine("The net amount is "+netAmount);
               
        }
        static void AverageDivBySeven()
        {
            int iCount = 0, iSum = 0,iNum;
            for (int i = 0; i < 15; i++)
            {
                Console.WriteLine("Please enter the number");
                iNum = int.Parse(Console.ReadLine());
                if(iNum%7 ==0)
                {
                    iSum += iNum;
                    iCount++;
                }
            }
            float result = iSum / iCount;
            Console.WriteLine("The average of the numbers divisible by 7 is "+result);  
        }
        static bool FindPrimeOrNot(int num)
        {
            bool bResult = true;
            for (int i = 2; i < num; i++)
            {
                if(num%i == 0)
                {
                    bResult = false;
                    break;
                }
            }
            return bResult;
        }
        static void TakeNumberAndCheckForPrime()
        {
            int iNum = 0;
            Console.WriteLine("Please enter the number");
            iNum = int.Parse(Console.ReadLine());
            if(FindPrimeOrNot(iNum)==true)
                Console.WriteLine("The number is prime");
            else
                Console.WriteLine("Not a prime number");
        }
        static void Main(string[] args)
        {
            //CalculateTotalAmount();
            TakeNumberAndCheckForPrime();
            Console.ReadKey();
        }
    }
}
