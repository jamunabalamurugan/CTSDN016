using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;

namespace ConsoleApp1
{
    class PasswordChange
    {
        LoginDetails loginDetailsObj = new LoginDetails();
        string connection = ConfigurationManager.ConnectionStrings["BankConnection"].ConnectionString;
        SqlConnection con = null;

        public SqlConnection GetConnection()
        {
            con = new SqlConnection(connection);
            con.Open();
            return con;
        }
        public void ChangePassword(int cusID)
        {
         //   int customerid = cusID;

            var hasNum = new Regex(@"[0-9]+");
            var hasUp = new Regex(@"[A-Z]+");
            var hasLen = new Regex(@".{8,15}");
            var hasSplChar = new Regex(@"[@#$!%]+");

            int customerID = cusID;

            Console.WriteLine("Enter old password :");
            string oldpass = Console.ReadLine();
            con = GetConnection();

            SqlCommand command = new SqlCommand("OldPass", con);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add(new SqlParameter("@cusid",customerID));
            string pass = command.ExecuteScalar().ToString();
            while(!oldpass.Equals(pass))
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("Please Enter valid old password...!");
                Console.ForegroundColor = ConsoleColor.White;
                oldpass = Console.ReadLine();
            }
            Console.WriteLine("\nYour Password must contain\n1. Uppercase\n2. Lowercase\n3. Digits\n4. SpecialCharecters(@#$!%)\n5. Length Must be Minimum 8 and Maximum 15\n");
            Console.WriteLine("Enter new password :");
            string newpass = Console.ReadLine();
            while (!(hasNum.IsMatch(newpass) && hasUp.IsMatch(newpass) && hasLen.IsMatch(newpass) && hasSplChar.IsMatch(newpass)))
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("Please Enter valid new password...!");
                Console.ForegroundColor = ConsoleColor.White;
                newpass = Console.ReadLine();
            }

            Console.WriteLine("Confirm your new password :");
            string Cnewpass = Console.ReadLine();
            while (!(hasNum.IsMatch(Cnewpass) && hasUp.IsMatch(Cnewpass) && hasLen.IsMatch(Cnewpass) && hasSplChar.IsMatch(Cnewpass)))
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("Please Enter valid Confirmation password...!");
                Console.ForegroundColor = ConsoleColor.White;
                Cnewpass = Console.ReadLine();
            }
            con.Close();



            if (newpass.Equals(Cnewpass))
            {
                con = GetConnection();
                SqlCommand command1 = new SqlCommand("ChangePassword", con);
                command1.CommandType = CommandType.StoredProcedure;

                command1.Parameters.Add(new SqlParameter("@customer_id", customerID));
                command1.Parameters.Add(new SqlParameter("@newPass", newpass));

                int success = command1.ExecuteNonQuery();

                if (success == 1)
                {
                    Console.Clear();
                    Console.ForegroundColor = ConsoleColor.DarkGreen;
                    Console.WriteLine("Password changed successfully");
                    Console.ForegroundColor = ConsoleColor.White;
                    loginDetailsObj.ExistingCustomerLogin();
                }

            }
            else
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("Wrong Confirmation Password");
                Console.ForegroundColor = ConsoleColor.White;
            }
       
            con.Close();
        }
      
    }
}
