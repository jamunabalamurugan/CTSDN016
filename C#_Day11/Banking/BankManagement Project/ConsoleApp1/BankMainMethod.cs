using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;


namespace ConsoleApp1

{
    class Admin
    {

        public static SqlConnection con = null;
        public static SqlCommand cmd = null;
        static string connection = ConfigurationManager.ConnectionStrings["BankConnection"].ConnectionString;

        public static SqlConnection Connection()
        {
            //con= new SqlConnection("Data source=.;Initial Catalog=Northwind;" + "User Id=sa;Password=newuser123#");
            con = new SqlConnection(connection);
            con.Open();
            return con;
        }
      


        public void admin()
        {
            try
            {


                Options option = new Options();
                option.Option_select();

                Console.ReadLine();
                con.Close();
            }
            catch(Exception e)
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine(e.Message+" try again");
                Console.ForegroundColor = ConsoleColor.White;
                Admin admin = new Admin();
                admin.admin();
            }
             Console.Read();
        }
    }
    class Options
    {
        public void Option_select()
        {
            Console.Clear();
            string choice = "1";
            Console.WriteLine("Welcome Admin");


            while (choice != "0")
            {
                Console.WriteLine("Press\n 1 ==> Customer_Info\n 2 ==> Display_Transaction_Info\n 3 ==> Account_Details\n 4 ==> Modify_Customer_Details\n 5 ==> Add_Account\n 6 ==> Deactivate_Account\n 7 ==> Remove_Account\n 0 ==> Logout");
                choice = Console.ReadLine();
                switch (choice)
                {
                    case "1":
                        try
                        {
                            Customer_Info cusInfo = new Customer_Info();
                            cusInfo.Display();
                        }
                        catch(Exception e)
                        {
                            Console.WriteLine(e.Message);
                        }
                        break;
                    case "2":
                        try
                        {
                            Transactions trans = new Transactions();
                            trans.Display();
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine(e.Message);
                        }
                        break;
                    case "3":

                        try
                        {
                            AccountDetails account = new AccountDetails();
                            account.Display();
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine(e.Message);
                        }
                        break;
                    case "4":
                        try
                        {
                            Modify_account modify = new Modify_account();
                            modify.Display();
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine(e.Message);
                           
                        }

                        break;
                    case "5":
                        try
                        {
                            Add_account add = new Add_account();
                            add.Account();
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine(e.Message);
                        }
                        break;
                    case "6":
                        try
                        {
                            Deactivate_account deactive = new Deactivate_account();
                            deactive.Deactivate();
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine(e.Message);
                        }

                        break;
                    case "7":
                        try
                        {
                            Removeaccount remove = new Removeaccount();
                            remove.delete();
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine(e.Message);
                        }
                        break;
                    case "0":
                        LoginDetails loginDetailsObj = new LoginDetails();
                        loginDetailsObj.FirstLogin();
                       // System.Environment.Exit(0);
                        break;
                    default:
                        Console.ForegroundColor = ConsoleColor.DarkRed;
                        Console.WriteLine("invalid choice");
                        Console.ForegroundColor = ConsoleColor.White;

                        break;

                }

            } 


            Console.WriteLine("**********  Thank You  ****************");

        }
    }
}

