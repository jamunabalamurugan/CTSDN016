using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using ConsoleTables;
namespace ConsoleApp1
{
    public class BankApplication
    {
        LoginDetails loginDetailsObj = new LoginDetails();
        string connection = ConfigurationManager.ConnectionStrings["BankConnection"].ConnectionString;
        SqlConnection con = null;
        SqlCommand cmd = null;
        public SqlConnection GetConnection()
        {
            con = new SqlConnection(connection);
            con.Open();
            return con;
        }
        public void DisplayTransactionDetails(int custid)
        {
            con = GetConnection();
            cmd = new SqlCommand("TransactionDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@cusid", custid));
            SqlDataReader dr = cmd.ExecuteReader();
            Console.Clear();
            Console.WriteLine("Your Transaction Details are \n:");
            var table = new ConsoleTable("Transaction ID", "Account Number", "Transaction Type", "Amount", "RecipientAccNo", "Transaction Date");
            while (dr.Read())
            {
                table.AddRow(dr[0], dr[1], dr[2], dr[3], dr[4], dr[5]);
            }
            table.Write();
            Console.WriteLine("Press Any Key to Continue...........");
            Console.ReadKey();
            loginDetailsObj.CustomerOptions(custid);
        }

        public void DisplayAccountDetails(int custid)
        {
            con = GetConnection();
            cmd = new SqlCommand("AccountDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@cusid", custid));
            SqlDataReader dr = cmd.ExecuteReader();
            Console.Clear();
            Console.WriteLine("Your Account Details are \n:");
            var table = new ConsoleTable("Account Number", "Account Type", "Balance", "Account Status", "Customer ID", "IFSC");

            while (dr.Read())
            {
                table.AddRow(dr[0], dr[1], dr[2], dr[3], dr[4], dr[5]);
            }
            table.Write();
            Console.WriteLine("Press Any Key to Continue...........");
            Console.ReadKey();
            loginDetailsObj.CustomerOptions(custid);
        }
    }
}
