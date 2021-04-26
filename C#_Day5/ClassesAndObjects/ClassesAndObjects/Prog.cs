using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesAndObjects
{
    class Bank
    {
       
            internal int AccountNumber;
            internal string AccountType;
            internal string CustomerName;
            internal string TransactionType;
            internal int Amount;
            internal int Balance;
            public Bank(int AccountNumber, string AccountType, string CustomerName, string TransactionType,
                int Amount, int Balance)
            {
                this.AccountNumber = AccountNumber;
                this.AccountType = AccountType;
                this.CustomerName = CustomerName;
                this.TransactionType = TransactionType;
                this.Amount = Amount;
                this.Balance = Balance;

                if (TransactionType == "D")
                {
                    Balance = Balance + Amount;
                    Console.WriteLine("The new balance is  " + Balance);
                }
                else
                {

                    Balance = Balance - Amount;
                    Console.WriteLine("The new balance is  " + Balance);
                }
            }

        }

    
        class Prog : Bank
        {


            internal  Prog(int AccountNumber, string AccountType, string CustomerName, string TransactionType,
               int Amount, int Balance) : base(AccountNumber, AccountType, CustomerName, TransactionType,
                Amount, Balance)
            {
                this.AccountNumber = AccountNumber;
                this.AccountType = AccountType;
                this.CustomerName = CustomerName;
                this.TransactionType = TransactionType;
                this.Amount = Amount;
                this.Balance = Balance;

            }
            static void Main()
            {
                int AccountNumber; string AccountType; string CustomerName; string TransactionType;
                int Amount; int Balance;
                Console.WriteLine("Enter the accountnumber,account type ,customername,transaction type,amount,balance  " +
                    " Enter transation type as D for deposit  and w for withdaw");
                AccountNumber = Convert.ToInt32(Console.ReadLine());
                AccountType = (Console.ReadLine());
                CustomerName = (Console.ReadLine());
                TransactionType = (Console.ReadLine());
                Amount = Convert.ToInt32(Console.ReadLine());
                Balance = Convert.ToInt32(Console.ReadLine());

                Prog p1 = new Prog(AccountNumber, AccountType, CustomerName, TransactionType,
                Amount, Balance);
                Console.Read();



            }
        }
   }


