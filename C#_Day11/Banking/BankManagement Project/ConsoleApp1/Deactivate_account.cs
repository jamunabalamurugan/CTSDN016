using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace ConsoleApp1
{
    class Deactivate_account
    {
        public static SqlConnection con1 = null;
        public Deactivate_account()
        {
            con1 = Admin.Connection();
        }
        public void Deactivate()
        {
            Console.Clear();
            Console.WriteLine("Deactivate Account or activate account            press 0 to go back");
            Console.WriteLine("ENTER CUSTOMER ID");
            int input = Convert.ToInt32(Console.ReadLine());
            if(input!=0)
            {
                Console.WriteLine("ENTER STATUS");
                string status = Console.ReadLine();

                SqlCommand cmd = new SqlCommand("DeactivateAccount", con1);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@customer_id", input));
                cmd.Parameters.Add(new SqlParameter("@account_status", status));
                int acc = cmd.ExecuteNonQuery();
                if (acc == 0)
                {
                    Console.WriteLine("Invalid customer id");
                }
                else
                {

                    Console.WriteLine(acc + " account deactivated");
                    Console.WriteLine("***********     STATUS CHANGED          ***************");
                    con1.Close();
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
