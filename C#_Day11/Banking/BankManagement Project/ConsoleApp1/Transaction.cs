using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ConsoleApp1
{
    class TransactionDetails
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
        public void TransactionAccNo(int acc_num,int to_acc_num, decimal balance, int cusid)
        {
            con = GetConnection();
            cmd = new SqlCommand("TransactionUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@acc_no", acc_num));
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                int acc_no = (int)dr[0];
                decimal bal = (decimal)dr[1];
                if ((string)dr[2] == "Inactive")
                {
                    Console.ForegroundColor = ConsoleColor.DarkRed;
                    Console.WriteLine("Sorry! Your Status is " + dr[2] + " For Long Period time\nPlease Visit Your Branch To Make it Active");
                    Console.ForegroundColor = ConsoleColor.White;
                    break;
                }
               
                else if (bal < balance)
                {
                    Console.ForegroundColor = ConsoleColor.DarkRed;
                    Console.WriteLine("Sorry! Your Account Balance is : " + dr[1]);
                    Console.ForegroundColor = ConsoleColor.White;
                    Continuation(cusid);
                }
                else if (acc_no != acc_num)
                {
                    Console.ForegroundColor = ConsoleColor.DarkRed;
                    Console.WriteLine("Sorry! Invalid Account Number!!\nPlease Enter Correct Account Number!!!");
                    Console.ForegroundColor = ConsoleColor.White;
                    Continuation(cusid);
                }
                else
                {
                    UpdateAccountDetails(acc_no, to_acc_num, balance,cusid);
                    UpdateTransactionDetails(acc_num, to_acc_num, balance, cusid);
                }
            }
            con.Close();
        }
        public void UpdateAccountDetails(int acc_num,int to_accnum,decimal balance,int cusid)
        {
            con = GetConnection();
            cmd = new SqlCommand("UpdateAccount", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@acc_no", acc_num));
            cmd.Parameters.Add(new SqlParameter("@to_acc_no", to_accnum));
            cmd.Parameters.Add(new SqlParameter("@debitbal", balance));
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    if (acc_num == to_accnum)
                    {
                        Console.ForegroundColor = ConsoleColor.DarkRed;
                        Console.WriteLine("Choose Different Account Number\nCan't Transfer to Same Account");
                        Console.ForegroundColor = ConsoleColor.White;
                        Continuation(cusid);
                    }
                    else if ((string)dr[1] == "Inactive")
                    {
                        Console.ForegroundColor = ConsoleColor.DarkRed;
                        Console.WriteLine("Sorry, Can't Transfer Amount\nAccount is In-Active");
                        Console.ForegroundColor = ConsoleColor.White;
                        Continuation(cusid);
                    }
                    else if (dr[0] == null)
                    {
                        Console.ForegroundColor = ConsoleColor.DarkRed;
                        Console.WriteLine("Please Enter the Valid To Account Number");
                        Console.ForegroundColor = ConsoleColor.White;
                        Continuation(cusid);
                    }
                }
            }
            else
            {
                Console.Clear();
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("Please Enter valid Credentials!!!");
                Console.ForegroundColor = ConsoleColor.White;
                Repitition(cusid);
            }
        }
        public void UpdateTransactionDetails(int acc_num,int  to_accnum,decimal balance, int cusid)
        {
            con = GetConnection();
            cmd = new SqlCommand("UpdateTransactionDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@acc_no", acc_num));
            cmd.Parameters.Add(new SqlParameter("@to_acc_no", to_accnum));
            cmd.Parameters.Add(new SqlParameter("@debitbal", balance));
            cmd.Parameters.Add(new SqlParameter("@trans_date", DateTime.Now));
            SqlDataReader dr = cmd.ExecuteReader();
            bool sta = false;
            while(dr.Read())
            {
                if((int)dr[0] == to_accnum)
                {
                    sta = true;
                }
            }
            if(sta == false)
            {
                Console.ForegroundColor = ConsoleColor.DarkRed;
                Console.WriteLine("Please Enter the Valid Recipient Account Number");
                Console.ForegroundColor = ConsoleColor.White;
                Continuation(cusid);
            }
            else
            {
                Console.ForegroundColor = ConsoleColor.DarkGreen;
                Console.WriteLine("Transaction Successfull!!");
                Console.ForegroundColor = ConsoleColor.White;
                Continuation(cusid);
            }
        }
        public void Continuation(int cusid)
        {
            string point;
            Console.WriteLine("Do You Want To Continue With the Transaction (Y/N)");
            point = Console.ReadLine();
            if (point == "y" | point == "Y")
            {
                Console.Clear();
                Repitition(cusid);
            }
            else if(point == "n" | point == "N")
            {
                Console.Clear();
                loginDetailsObj.CustomerOptions(cusid);
            }
            else
            {
                Console.WriteLine("Please Choose the Correct Input");
                Continuation(cusid);
            }
        }
        public void Repitition(int cusid)
        {
            Console.WriteLine("Enter the Amount to Transfer:");
            decimal balance = Convert.ToDecimal(Console.ReadLine());
            Console.WriteLine("Enter the Account Number To Transfer Amount : ");
            int to_accnum = Convert.ToInt32(Console.ReadLine());
           
            SqlConnection newconnection = GetConnection();
            SqlCommand command = new SqlCommand("RetAccNo", newconnection);
            command.CommandType = CommandType.StoredProcedure;
          
            command.Parameters.Add(new SqlParameter("@cusid", cusid));

            int accnum =(int)command.ExecuteScalar();
            TransactionAccNo(accnum, to_accnum, balance,cusid);
        }

    }
}

