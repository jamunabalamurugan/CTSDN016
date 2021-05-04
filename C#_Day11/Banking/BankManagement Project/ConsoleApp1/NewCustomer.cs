using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
using ConsoleTables;

namespace ConsoleApp1
{
    class NewCustomer
    {
        string connection = ConfigurationManager.ConnectionStrings["BankConnection"].ConnectionString;
        SqlConnection con = null;

        public SqlConnection GetConnection()
        {
            con = new SqlConnection(connection);
            con.Open();
            return con;
        }
        public void CreateAccount()
        {
            Regex regexPAN = new Regex("(^([A-Za-z]{5})([0-9]{4})([A-Za-z]{1})$)");
            Regex regexPHONE = new Regex("^([6-9]{1})([0-9]{9})$");
            Regex regexNAME = new Regex("^([a-zA-Z]*)( ?)([a-zA-Z]*?)( ?)([a-zA-Z]*?)$");
            Regex regexDOB = new Regex("^[1-9]{1}[0-9]{3}-(0?[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$");
            Regex regexCITY = new Regex("^[a-zA-Z]*$");
            Regex regexIFSC = new Regex("^LTIB([0-9]{4})$");


            var hasNum = new Regex(@"[0-9]+");
            var hasUp = new Regex(@"[A-Z]+");
            var hasLen = new Regex(@".{8,15}");
            var hasSplChar = new Regex(@"[@#$!%]+");

            Console.WriteLine("Enter Your Name:");
            string name = Console.ReadLine();
            while (!regexNAME.IsMatch(name))
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("Name should not contain\n1. Numbers\n2. Special Characters\n3. More than two Spaces");
                Console.WriteLine("Please Enter Valid Name:");
                Console.ForegroundColor = ConsoleColor.White;
                name = Console.ReadLine();
            }
            Console.WriteLine("\nYour Password must contain\n1. Uppercase\n2. Lowercase\n3. Digits\n4. " +
                 "SpecialCharecters(@#$!%)\n5. Length Must be Minimum 8 and Maximum 15\n");

            Console.WriteLine("Create your Secure Password");
            string pin = Console.ReadLine();
            while (!(hasNum.IsMatch(pin) && hasUp.IsMatch(pin) && hasLen.IsMatch(pin) && hasSplChar.IsMatch(pin)))
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("Please Enter Valid Password");
                Console.ForegroundColor = ConsoleColor.White;
                pin = Console.ReadLine();
            }



            Console.WriteLine("Select your gender (MALE/FEMALE/OTHERS)"); //validated only(MFO or mfo)
            string gender = Console.ReadLine();
            while (!gender.Equals("MALE") && !gender.Equals("FEMALE") && !gender.Equals("OTHERS"))
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("select valid gender (MALE/FEMALE/OTHERS)");
                Console.ForegroundColor = ConsoleColor.White;
                gender = Console.ReadLine();
            }


            Console.WriteLine("Date of birth (yyyy-mm-dd)"); //validated
            string dob = Console.ReadLine();

            while (!regexDOB.IsMatch(dob))
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine(" valid Date of birth (yyyy-mm-dd)");
                Console.ForegroundColor = ConsoleColor.White;
                dob = Console.ReadLine();
            }
            Console.WriteLine("Enter your city"); //validated only char no numbers
            string address = Console.ReadLine();

            while (!regexCITY.IsMatch(address))
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("City should not contain\n1. Numbers\n2. Special Characters\n3. Spaces\n");
                Console.WriteLine("Enter proper city name");
                Console.ForegroundColor = ConsoleColor.White;
                address = Console.ReadLine();
            }


            Console.WriteLine("Enter Your PAN number (eg.AAAAA1111A)");  // validated must be 10 in length and format (xxxxx1111x)
            string pan = Console.ReadLine();

            while (!regexPAN.IsMatch(pan))
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine(" Enter validPAN number");
                Console.ForegroundColor = ConsoleColor.White;
                pan = Console.ReadLine();
            }

            Console.WriteLine("Phone Number");     //validated only num and 10 digits must
            string phno = Console.ReadLine();
            while (!regexPHONE.IsMatch(phno))
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("Enter valid Phone Number");
                Console.ForegroundColor = ConsoleColor.White;
                phno = Console.ReadLine();
            }

            con = GetConnection();
            SqlCommand command = new SqlCommand("AvailableBank", con);
            command.CommandType = CommandType.StoredProcedure;

            SqlDataReader reader = command.ExecuteReader();
            List<string> ifsclist = new List<string>();


            var table = new ConsoleTable("IFSC", "Branch Name", "Address");

            while (reader.Read())
            {
                table.AddRow(reader[0], reader[1], reader[2]);
                ifsclist.Add(reader[0].ToString());
            }

            table.Write();

            Console.WriteLine("Enter IFSC"); //validated format (CITIxxxx)
            string ifsc = Console.ReadLine();
            bool status = false;

            StatusCheck: if (ifsclist.Contains(ifsc))
            {
                status = true;
            }


            while (!regexIFSC.IsMatch(ifsc) | status == false)
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("Enter proper IFSC");
                Console.ForegroundColor = ConsoleColor.White;
                ifsc = Console.ReadLine();
                goto StatusCheck;
            }

            Console.WriteLine("Select type of account (Savings/Current)"); //validated 
            string type = Console.ReadLine();

            while (!type.Equals("Savings") && !type.Equals("Current"))
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("Select Proper type of account (Savings/Current)");
                Console.ForegroundColor = ConsoleColor.White;
                type = Console.ReadLine();
            }

            con = GetConnection();

            command = new SqlCommand("NewCustomer", con);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add(new SqlParameter("@cusname", name));
            command.Parameters.Add(new SqlParameter("@cuspin", pin));
            command.Parameters.Add(new SqlParameter("@gen", gender));
            command.Parameters.Add(new SqlParameter("@dob", dob));
            command.Parameters.Add(new SqlParameter("@cusadd", address));
            command.Parameters.Add(new SqlParameter("@pan", pan));
            command.Parameters.Add(new SqlParameter("@phno", phno));
            command.Parameters.Add(new SqlParameter("@ifsc", ifsc));

            command.ExecuteNonQuery();

            con = GetConnection();

            command = new SqlCommand("NewCustomerID", con);
            command.CommandType = CommandType.StoredProcedure;

            reader = command.ExecuteReader();

            int cusid = 0;
            string cusifsc = "";

            while (reader.Read())
            {
                cusid = (int)reader[0];
                cusifsc = reader[1].ToString();
            }
            Console.WriteLine("{0}|{1}", cusid, cusifsc);
            GetConnection();
            command = new SqlCommand("NewAccount", con);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add(new SqlParameter("@acctype", type));
            command.Parameters.Add(new SqlParameter("@cusid", cusid));
            command.Parameters.Add(new SqlParameter("@ifsc", cusifsc));

            command.ExecuteNonQuery();
            Console.Clear();
            Console.ForegroundColor = ConsoleColor.DarkGreen;
            Console.WriteLine("Successfully created Your Account...!");
            Console.ForegroundColor = ConsoleColor.White;
            LoginDetails loginDetailsObj = new LoginDetails();
            loginDetailsObj.Customer_login();
            //    Console.WriteLine();
        }
    }
}
