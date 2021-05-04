using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using ConsoleTables;

namespace ConsoleApp1
{
    class Transactions
    {
        public static SqlConnection con = null;
        public Transactions()
        {
            con = Admin.Connection();
        }
        public void Display()
        {
            Console.Clear();
            SqlCommand cmd = new SqlCommand("Display_transanctions", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            var table = new ConsoleTable("Transaction Id","Account Number","Transaction Type","Amount","Transaction Date");
            //Console.WriteLine("x----------------x------------x----------x--------------x---------------x-------------x");
            //Console.WriteLine($"|{"Transaction Id",-16}|{"Account Number",-12}|{"Transaction Type",-10}|{"Amount",-14}|{"Transaction Date",-21}|");
            //Console.WriteLine("x----------------x------------x----------x--------------x---------------x-------------x");
            while (dr.Read())
            {
                table.AddRow(dr[0],dr[1],dr[2],dr[3],dr[4]);
               // Console.WriteLine($"|{dr[0],-16}|{dr[1],-14}|{dr[2],-16}|{dr[3],-14}|{dr[4],-21}|");
            }
            //   Console.WriteLine("x----------------x--------------x----------------x----------------x-------------------x");
            table.Write();
            con.Close();
            Console.WriteLine("\n");
            Console.WriteLine("Press 1 to find out customers with no transactions");
            Console.WriteLine("\n");
            int back = Convert.ToInt32(Console.ReadLine());
            if (back == 1)
            {
                Inactive Act = new Inactive();
                Act.Display();
            }
        }
    }
    class Inactive
    {
        public static SqlConnection con1 = null;
        public Inactive()
        {
            con1 = Admin.Connection();
        }
        public void Display()
        {
            Console.Clear();
            SqlCommand cmd = new SqlCommand("NON_active", con1);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataReader dr1 = cmd.ExecuteReader();
            Console.WriteLine("\n");
            var table = new ConsoleTable("Customer Id","Account Number");
            //Console.WriteLine("x----------------x--------------x");
            //Console.WriteLine($"|{"Customer Id",-16}|{"Account Number",-12}|");
            //Console.WriteLine("x----------------x--------------x");
            while (dr1.Read())
            {
                table.AddRow(dr1[0],dr1[1]);
                //Console.WriteLine($"|{dr1[0],-16}|{dr1[1],-14}|");
            }
            table.Write();
            //Console.WriteLine("x----------------x--------------x");
            //Console.WriteLine("\n");
            con1.Close();
        }
    }
}
