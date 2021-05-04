using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace ConsoleApp1
{
    class Modify_account
    {
        public static SqlConnection con1 = null;
        public Modify_account()
        {
            
        }
        public void Display()
        {
            
                Console.Clear();
            string choice = "1";
            do
            {

                Console.WriteLine("Press \n 1 ==> ChangeName\n 2 ==> ChangeAddress\n 3 ==> Change_PhoneNumber\n 4 ==> Date_Of_Birth\n 5 ==> Exit");
                choice = Console.ReadLine();
                switch (choice)
                {
                    case "1":
                        ChangeName();
                        break;
                    case "2":
                        ChangeAddress();
                        break;
                    case "3":
                        ChangePhoneNumber();
                        break;
                    case "4":
                        ChangeDateOfBirth();
                        break;
                    case "5":
                        choice = "0";
                        break;
                    default:
                            Console.WriteLine("Wrong input try again");
                            
                            break;
                }

            } while (choice != "0");
            
        }
        public void ChangeName()
        {
            
                con1 = Admin.Connection();
                Console.WriteLine("entert the customer id");
                int CustomerId = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("entert the new name");
                string Customername = Console.ReadLine();
                SqlCommand cmd1 = new SqlCommand("Modify_name", con1);
                cmd1.CommandType = CommandType.StoredProcedure;

                cmd1.Parameters.Add(new SqlParameter("@customer_id", CustomerId));
                cmd1.Parameters.Add(new SqlParameter("@customername", Customername));
                SqlDataReader dr1 = cmd1.ExecuteReader();
                if (dr1.RecordsAffected != 0)
                {
                    Console.ForegroundColor = ConsoleColor.DarkGreen;
                    Console.WriteLine("Successfully modified");
                    Console.ForegroundColor = ConsoleColor.White;
                    con1.Close();
                }
                else
                {
                    Console.ForegroundColor = ConsoleColor.DarkRed;
                    Console.WriteLine("Invalid Inputs please try again");
                    Console.ForegroundColor = ConsoleColor.White;
                }
           
        }
        public void ChangeAddress()
        {
            
            con1 = Admin.Connection();
            Console.WriteLine("entert the customer id");
            int CustomerId = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("entert the new address");
            string Customeraddress = Console.ReadLine();
            SqlCommand cmd1 = new SqlCommand("Modify_customeraddress", con1);
            
            cmd1.CommandType = CommandType.StoredProcedure;

            cmd1.Parameters.Add(new SqlParameter("@customer_id", CustomerId));
            cmd1.Parameters.Add(new SqlParameter("@customer_address", Customeraddress));
            SqlDataReader dr1 = cmd1.ExecuteReader();
            
            if (dr1.RecordsAffected != 0)
            {
                Console.ForegroundColor = ConsoleColor.DarkGreen;
                Console.WriteLine("Successfully modified" );
                Console.ForegroundColor = ConsoleColor.White;
                con1.Close();
            }
            else
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("Invalid Inputs please try again");
                Console.ForegroundColor = ConsoleColor.White;
            }
        
        }
        public void ChangePhoneNumber()
        {
            con1 = Admin.Connection();
            Console.WriteLine("entert the customer id");
            int CustomerId = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("entert the new number");
            string Customernumber = Console.ReadLine();
            SqlCommand cmd1 = new SqlCommand("Modify_phone_number", con1);
            cmd1.CommandType = CommandType.StoredProcedure;

            cmd1.Parameters.Add(new SqlParameter("@customer_id", CustomerId));
            cmd1.Parameters.Add(new SqlParameter("@phone_number", Customernumber));
            SqlDataReader dr1 = cmd1.ExecuteReader();
            if (dr1.RecordsAffected != 0)
            {
                Console.ForegroundColor = ConsoleColor.DarkGreen;
                Console.WriteLine("Successfully modified");
                Console.ForegroundColor = ConsoleColor.White;
                con1.Close();
            }
            else
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("Invalid Inputs please try again");
                Console.ForegroundColor = ConsoleColor.White;
            }
        }


        public void ChangeDateOfBirth()
        {
            con1 = Admin.Connection();
            Console.WriteLine("entert the customer id");
            int CustomerId = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("entert the DOB");
            DateTime Customerdate = Convert.ToDateTime(Console.ReadLine());
            SqlCommand cmd1 = new SqlCommand("Modify_dateofbirth", con1);
            cmd1.CommandType = CommandType.StoredProcedure;

            cmd1.Parameters.Add(new SqlParameter("@customer_id", CustomerId));
            cmd1.Parameters.Add(new SqlParameter("@dateofbirth", Customerdate));
            SqlDataReader dr1 = cmd1.ExecuteReader();
            if (dr1.RecordsAffected != 0)
            {
                Console.ForegroundColor = ConsoleColor.DarkGreen;
                Console.WriteLine("Successfully modified");
                Console.ForegroundColor = ConsoleColor.White;
                con1.Close();
            }
            else
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("Invalid Inputs please try again");
                Console.ForegroundColor = ConsoleColor.White;
            }
        }
}
        
    }

