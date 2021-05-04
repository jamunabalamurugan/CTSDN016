using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace ConsoleApp1
{
    class Add_account
    {
        public static SqlConnection con1 = null;
        public Add_account()
        {
            con1 = Admin.Connection();
        }
        public void Account()
        {
            Console.Clear();
            Console.WriteLine("enter the account details");
            
            Console.WriteLine("ENTER ACCOUNT TYPE  SAVINGS/CURRENT");
            string Type = Console.ReadLine();
            Console.WriteLine("ENTER BALANCE");
            double Balance = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("ENTER ACCOUNT STATUS ACTIVE/INACTIVE");
            string Status = Console.ReadLine();
        
            
            Console.WriteLine("ENTER Customer Id");
            int customerid = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("ENTER IFSC CODE");
            string Ifsc =Console.ReadLine();
            try
            {
                SqlCommand cmd = new SqlCommand("Insert_account_details", con1);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@accounttype", Type));
                cmd.Parameters.Add(new SqlParameter("@balance", Balance));
                cmd.Parameters.Add(new SqlParameter("@customer_id", customerid));
                cmd.Parameters.Add(new SqlParameter("@account_status", Status));

                cmd.Parameters.Add(new SqlParameter("@ifsc", Ifsc));
                int acc = cmd.ExecuteNonQuery();
                if (acc == 0)
                {
                    Console.ForegroundColor = ConsoleColor.DarkRed;
                    Console.WriteLine("Invalid Inputs please try again");
                    Console.ForegroundColor = ConsoleColor.White;
                }
                else
                {
                    Console.WriteLine("Number of details added" + acc);
                    Console.ForegroundColor = ConsoleColor.DarkGreen;
                    Console.WriteLine("**********   ACCOUNT ADDED SUCESSFULLY    **************");
                    Console.ForegroundColor = ConsoleColor.White;
                }
            }
            catch(Exception e)
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("Invalid Inputs please try again",e.Message);
                Console.ForegroundColor = ConsoleColor.White;
            }
            
            
            
        }
    }
}
