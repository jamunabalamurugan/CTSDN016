using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace ConsoleApp1
{
    class LoginDetails
    {
        public int customerid;

        public static SqlConnection con = null;
        public static SqlCommand cmd = null;
        static string connection = ConfigurationManager.ConnectionStrings["BankConnection"].ConnectionString;
        public void Display(int left, int top, string s)
        {
            Console.SetCursorPosition(left, top);
            Console.Write(s);
        }
        public static SqlConnection GetConnection()
        {
            con = new SqlConnection("Data Source=INFCH03643;Initial Catalog=bankdatabase; user ID=sa;Password=newuser123#");
            con = new SqlConnection(connection);
            con.Open();
            return con;
        }
        public void Customer_Details(int userid, string pass)
        {
            con = GetConnection();
            SqlCommand cmd = new SqlCommand("ValidationLogin", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@cusid", userid));
            cmd.Parameters.Add(new SqlParameter("@cus_pass", pass));
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read() == false)
            {
                Console.Clear();
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("INVALID USER ID or INVALID PIN");
                Console.ForegroundColor = ConsoleColor.White;
                ExistingCustomerLogin();

            }
            else
            {
                int id;
                string upass;
                while (dr.Read())
                {
                    id = (int)dr[0];
                    upass = (string)dr[1];
                    bool valid = string.Equals(userid, id);
                    Console.WriteLine(valid);
                    if (userid == id && pass == upass)
                    {
                        Console.Clear();
                        Console.ForegroundColor = ConsoleColor.DarkGreen;
                        Console.Write("LOGIN SUCCESSFULLY");
                        Console.ForegroundColor = ConsoleColor.White;
                        Console.WriteLine("\nWELCOME " + dr[2]);
                    }
                    else
                    {
                        Console.Clear();
                        Console.ForegroundColor = ConsoleColor.DarkRed;
                        Console.WriteLine("\nINVALID USER ID or INVALID PIN ");
                        Console.ForegroundColor = ConsoleColor.White;
                        ExistingCustomerLogin();
                    }
                }
            }
        }
        public void FirstLogin()
        {
            Console.Clear();
     
            Console.WriteLine("\nPRESS ====> 1\tADMIN LOGIN\nPRESS ====> 2\tCUSTOMER LOGIN\nPRESS ====> 3\tEXIT\n");
            Console.WriteLine("ENTER YOUR CHOICE");
            string str = Console.ReadLine();
            switch (str)
            {
                case "1":
                    AdminLogin();
                    break;
                case "2":
                    Customer_login();
                    break;
                case "3":
                    Console.Clear();
                    //Console.ForegroundColor = ConsoleColor.DarkRed;
                    Display(45, 15, "*****THANK YOU*****");
                    break;
                default:
                    Console.ForegroundColor = ConsoleColor.DarkRed;
                    Console.WriteLine("\nSORRY YOU ENTERED WRONG CHOICE..!!!!!");
                    Console.WriteLine("PLEASE ENTER CORRECT CHOICE...");
                    Console.ForegroundColor = ConsoleColor.White;
                    Console.ReadKey();
                    FirstLogin();
                    break;
            }
        }
        public void AdminLogin()
        {
            Regex regexID = new Regex("^[0-9]{1}$");
            Regex regexPASS = new Regex("^[0-9]{4}$");


            Console.Clear();
            Console.WriteLine("ENTER THE ADMIN DETAILS\n");
            Console.WriteLine("\nENTER THE ADMIN ID");
            string admin_id = (Console.ReadLine());
            while (!regexID.IsMatch(admin_id))
            {
                Console.WriteLine("\nENTER valid ADMIN ID");
                admin_id = (Console.ReadLine());

            }

            Console.WriteLine("ENTER THE ADMIN PASSWORD ");
            //string admin_password = (Console.ReadLine());
            ConsoleKeyInfo key;
            string admin_password = "";
            do
            {
                key = Console.ReadKey(true);
                if (key.Key != ConsoleKey.Backspace) // Backspace Should Not Work
                {
                    if(key.Key != ConsoleKey.Enter)
                    {
                        admin_password += key.KeyChar;
                        Console.Write("*");
                    }
                }
            } while (key.Key != ConsoleKey.Enter);
           

            while (!regexPASS.IsMatch(admin_password))
            {
                Console.WriteLine("\nENTER valid ADMIN PASSWORD ");
                admin_password = "";
                do
                {
                    key = Console.ReadKey(true);
                    if (key.Key != ConsoleKey.Backspace) // Backspace Should Not Work
                    {
                        if (key.Key != ConsoleKey.Enter)
                        {
                            admin_password += key.KeyChar;
                            Console.Write("*");
                        }
                    }
                } while (key.Key != ConsoleKey.Enter);
             //   admin_password = (Console.ReadLine());
            }
            con = GetConnection();
            //   con.Open();
            int ad_id = Convert.ToInt32(admin_id);
            int ad_pass = Convert.ToInt32(admin_password);
            SqlCommand cmd = new SqlCommand("AdminLoginValidation", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@adid", ad_id));
            cmd.Parameters.Add(new SqlParameter("@adpass", ad_pass));
            SqlDataReader dr = cmd.ExecuteReader();

            int aid, adpass;

            while (dr.Read())
            {
                    aid = (int)dr[0];
                    adpass =(int) dr[1];
                if (ad_id == aid && ad_pass == adpass)
                {
                    Console.ForegroundColor = ConsoleColor.DarkGreen;
                    Console.WriteLine("LOGIN SUCESSFULL");
                    Console.ForegroundColor = ConsoleColor.White;
                    Admin adminObj = new Admin();
                    adminObj.admin();
                }
                else
                {
                    Console.ForegroundColor = ConsoleColor.DarkRed;
                    Console.WriteLine("Invalid credentials");
                    Console.ForegroundColor = ConsoleColor.White;
                    Console.ReadKey();
                    AdminLogin();
                }
            }
       
           

            return;
        }
    

   
        public void Customer_login()
        {
            Console.Clear();
            NewCustomer newCustomerObj = new NewCustomer();
            Console.WriteLine("\nPRESS ====> 1\tEXISTING USER\nPRESS ====> 2\tNEW USER\nPRESS ====> 3\tTO MAIN MENU\nPRESS ====> 4\tEXIT");
            Console.WriteLine("\nENTER YOUR CHOICE");
            string login = Console.ReadLine();
            switch (login)
            {
                case "1":
                    ExistingCustomerLogin();
                    break;
                //add New User while Integration
                case "2":
                    newCustomerObj.CreateAccount();
                    break;
                case "3":
                    FirstLogin();
                    break;
                case "4":
                    Console.Clear();
                    Display(45, 15, "*****THANK YOU*****");
                    break;
                default:
                    Console.ForegroundColor = ConsoleColor.DarkRed;
                    Console.WriteLine("\nSORRY YOU ENTERED WRONG CHOICE..!!!!!");
                    Console.ForegroundColor = ConsoleColor.White;
                    Console.WriteLine("PLEASE ENTER CORRECT CHOICE...");
                    Console.ReadKey();
                    Customer_login();
                    break;
            }
        }
        public void ExistingCustomerLogin()
        {
            try
            {
                Console.WriteLine("\nPLEASE ENTER YOUR CUSTOMER ID");
                customerid = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("\nPLEASE ENTER YOUR PASSWORD");
                ConsoleKeyInfo key;
                string pass = "";
                do
                {
                    key = Console.ReadKey(true);
                    if (key.Key != ConsoleKey.Backspace) // Backspace Should Not Work
                    {
                        if (key.Key != ConsoleKey.Enter)
                        {
                            pass += key.KeyChar;
                            Console.Write("*");
                        }
                    }
                } while (key.Key != ConsoleKey.Enter);
                Customer_Details(customerid, pass);
                CustomerOptions(customerid);
            }
            catch (Exception e)
            {
                Console.Clear();
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("\nINVALID USER ID or INVALID PIN ", e.Message);
                Console.ForegroundColor = ConsoleColor.White;
                ExistingCustomerLogin();
            }
        }
        public void CustomerOptions(int customerid)
        {
            BankApplication bankApplicationObj = new BankApplication();
            TransactionDetails transactionObj = new TransactionDetails();
            PasswordChange passwordChangeObj = new PasswordChange();
            //  Details detailsObj = new Details();
            CustomerDetail customerDetailObj = new CustomerDetail();
            Console.Clear();
            int cusid = customerid;
            Console.WriteLine("\nPRESS ===> 1 TO DISPLAY_ACCOUNTDETAILS\nPRESS ===> 2 TO TRANSACTION_DETAILS" +
                                                "\nPRESS ===> 3 YOUR PROFILE\nPRESS ===> 4 TO MONEY_TRANSFER\nPRESS ===> 5 TO CHANGE_PASSWORD\nPRESS ===> 6 TO LOGIN MENU" +
                                                "\nPRESS ===> 7 TO EXIT\n");
            Console.WriteLine("ENTER YOUR CHOICE");
            string choice = (Console.ReadLine());
            switch(choice)
            {
                case "1":
                    bankApplicationObj.DisplayAccountDetails(cusid);
                    break;
                case "2":
                    bankApplicationObj.DisplayTransactionDetails(cusid);
                    break;
                case "3":
                    customerDetailObj.CustomerDetails(cusid);
                    break;
                case "4":
                    transactionObj.Repitition(cusid);
                    break;
                case "5":
                    passwordChangeObj.ChangePassword(cusid);
                    break;
                case "6":
                    Customer_login();
                    break;
                case "7":
                    Console.Clear();
                    Display(45, 15, "*****THANK YOU*****");
                    break;
                default:
                    Console.ForegroundColor = ConsoleColor.DarkRed;
                    Console.WriteLine("\nSORRY YOU ENTERED WRONG CHOICE..!!!!!");
                    Console.WriteLine("PLEASE ENTER CORRECT CHOICE...");
                    Console.ForegroundColor = ConsoleColor.White;
                    Console.WriteLine("Press Any Key to Continue............");
                    Console.ReadKey();
                    Console.Clear();
                  //  goto Customer;
                    CustomerOptions(cusid);
                    break;


            }
        }
    }
}
