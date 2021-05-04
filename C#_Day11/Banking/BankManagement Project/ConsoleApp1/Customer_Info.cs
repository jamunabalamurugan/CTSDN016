using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using ConsoleTables;
namespace ConsoleApp1
{
    class Customer_Info
    {
        public static SqlConnection con = null;
        public Customer_Info()
        {
            con = Admin.Connection();

        }

        public void Display()
        {
            Console.Clear();
            SqlCommand cmd = new SqlCommand("Display_customer_details", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            //Console.WriteLine("*************************************************************************************************");
            var table = new ConsoleTable("CustomerId","Customer Name","Phone Number","Ifsc");
            //Console.WriteLine("x----------------x----------------x----------------x--------------x");
            //Console.WriteLine($"|{"CustomerId",-16}|{"Customer Name",-16}|{"Phone Number",-12}|{"Ifsc",-10}|");
            //Console.WriteLine("x----------------x----------------x----------------x-------------------x");
            while (dr.Read())
            {
                table.AddRow(dr[0],dr[1],dr[5],dr[6]);
               // Console.WriteLine(dr[0].ToString() + "  " + dr[1].ToString() + "  "  + dr[5].ToString() + "  " + dr[6].ToString());
              //  Console.WriteLine($"|{dr[0],-16}|{dr[1],-16}|{dr[5],-12}|{dr[6],-10}|");
            }
            table.Write();
            //Console.WriteLine("x----------------x----------------x----------------x--------------x");
            //Console.WriteLine("\n");

            con.Close();
            Console.WriteLine("Enter the customer Id to view the details     or        press 0 to exit"); 
            Single_customer singlec = new Single_customer();
            singlec.display_single_customer();
           
        }
        class Single_customer
        {
            public static SqlConnection con1 = null;
            public Single_customer()
            {
                con1 = Admin.Connection();
            }
           public void display_single_customer()
            {
                
                int CustomerId = Convert.ToInt32(Console.ReadLine());
                if (CustomerId != 0)
                {
                    SqlCommand cmd1 = new SqlCommand("Single_customer_info", con1);
                    cmd1.CommandType = CommandType.StoredProcedure;

                    cmd1.Parameters.Add(new SqlParameter("@customerId", CustomerId));
                    SqlDataReader dr1 = cmd1.ExecuteReader();

                    //if (dr1.Read() == true)
                    //{
                    //    //while (dr1.Read())
                    //    //{
                    //    //    Console.WriteLine("*************************************************************************************************");
                    //    //    Console.WriteLine(" customerId     customername         gender       DOB      address       phone number       ifsc");
                    //    //    Console.WriteLine("*************************************************************************************************");
                    //    //    Console.WriteLine(dr1[0].ToString() + "  " + dr1[1].ToString() + "  " + dr1[2].ToString() + "  " + dr1[3].ToString() + "  " + dr1[4].ToString() + "  " + dr1[5].ToString() + "  " + dr1[6].ToString());
                    //    //}.
                    //    for (int i = 0; i < dr1.FieldCount; i++)
                    //    {
                    //        Console.WriteLine(dr1[i].ToString());
                    //    }

                    //}
                    if (dr1.Read() == true)
                    {
                        //while (dr1.Read())
                        //{
                        //    Console.WriteLine("*************************************************************************************************");
                        //    Console.WriteLine(" customerId     customername         gender       DOB      address       phone number       ifsc");
                        //    Console.WriteLine("*************************************************************************************************");
                        //    Console.WriteLine(dr1[0].ToString() + "  " + dr1[1].ToString() + "  " + dr1[2].ToString() + "  " + dr1[3].ToString() + "  " + dr1[4].ToString() + "  " + dr1[5].ToString() + "  " + dr1[6].ToString());
                        //}.
                        Console.WriteLine("x--------------------------x---------------------------x--------------------------x--------------------------x");
                        for (int i = 0; i < dr1.FieldCount; i++)
                        {
                            Console.Write($"|{dr1[i].ToString(),-8}" + "\t");
                        }

                        Console.WriteLine("x--------------------------x---------------------------x--------------------------x--------------------------x");

                    }
                    else
                    {
                        Console.ForegroundColor = ConsoleColor.DarkRed;
                        Console.WriteLine("Invalid customer id");
                        Console.ForegroundColor = ConsoleColor.White;
                    }

                    con1.Close();

                    Console.WriteLine("\n");
                    
                    Console.WriteLine("press 0 to go back");
                    int back = Convert.ToInt32(Console.ReadLine());
                    if (back == 0)
                    {
                        Customer_Info cusInfo = new Customer_Info();
                        cusInfo.Display();
                    }
                }
                else
                {
                    Options op = new Options();
                    op.Option_select();
                }

            }

        }

    }
  
}
