using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using ConsoleTables;

namespace ConsoleApp1
{
    class AccountDetails
    {
        public static SqlConnection con1 = null;
        public AccountDetails()
        {
            con1 = Admin.Connection();
        }
        public void Display()
        {
            Console.Clear();
            Console.WriteLine("This is Account_Details");
            
            SqlCommand cmd = new SqlCommand("Display_account_info", con1);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            var table = new ConsoleTable("Customer Name","Account Number","Account Type","Balance","Account Status");
            //Console.WriteLine("x----------------x----------------------x---------------------x--------------------x");
            //Console.WriteLine($"|{"Customer Name",-16}|{"Account Number",-12}|{"Account Type",-14}|{"Balance",-14}|{"Account Status",-20}|");
            //Console.WriteLine("x----------------x----------------------x---------------------x--------------------x");
            while (dr.Read())
            {
                table.AddRow(dr[0],dr[1],dr[2],dr[3],dr[4]);
              //  Console.WriteLine($"|{dr[0],-16}|{dr[1],-14}|{dr[2],-14}|{dr[3],-14}|{dr[4],-20}|");
            }
            table.Write();
         //   Console.WriteLine("x----------------x----------------------x---------------------x--------------------x");
        }
    }
}
