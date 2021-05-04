using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace ConsoleApp1
{
    class Removeaccount
    {
        public static SqlConnection con1 = null;
        public Removeaccount()
        {
            con1 = Admin.Connection();
        }
        
        public void delete()
        {
            Console.Clear();
            Console.WriteLine("delete account");
            Console.WriteLine("PLEASE ENTER CUSTOMER ID                    press 0 to go back");
            int accountnumber = Convert.ToInt32(Console.ReadLine());
            
            SqlCommand cmd = new SqlCommand("Remove_account", con1);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@accountId", accountnumber));
            int acc = cmd.ExecuteNonQuery();
            if (acc == 0)
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("Invalid customer id");
                Console.ForegroundColor = ConsoleColor.White;
            }
            else
            {
                Console.ForegroundColor = ConsoleColor.DarkGreen;
                Console.WriteLine(acc + " account removed");
                Console.WriteLine("************   ACCOUNT REMOVED SUCESFULLY     ************");
                Console.ForegroundColor = ConsoleColor.White;
            }
        }
    }
}
