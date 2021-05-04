using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using ConsoleTables;

namespace ConsoleApp1
{
    class CustomerDetail
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
        public void CustomerDetails(int CustomerID)
        {
            con = GetConnection();
            SqlCommand command = new SqlCommand("CustomerDetails", con);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add(new SqlParameter("@cus_id", CustomerID));
            SqlDataReader reader = command.ExecuteReader();


            var table = new ConsoleTable("Customer ID", "Customer Name", "Gender", "Date of Birth", "Customer Address", "Pan Number", "Phone Number", "IFSC");
            while (reader.Read())
            {
                table.AddRow(reader[0], reader[1], reader[2], reader[3], reader[4], reader[5], reader[6], reader[7]);
            }
            table.Write();
            Console.WriteLine("Press Any Key to Continue........");
            Console.ReadKey();
            loginDetailsObj.CustomerOptions(CustomerID);
        }
    }
}
