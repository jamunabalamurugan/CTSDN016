using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DelegatesEg
{
	public class PrintToDeviceDemo
	{
		//Creating the variables of Stream classes
		static FileStream FStream;
		static StreamWriter SWriter;
		//Defining a Delegate
		public delegate void PrintData(String s);


		//Method to send the string data to respective methods
		//Method to print a string to the console
		public static void WriteConsole(string str)
	{
		Console.WriteLine("{0} My Console", str);
	}
	//Method to print a string to a file
	public static void WriteFile(string s)
	{
		//Initializing stream objects
		FStream = new FileStream(@"e:\cts\StoreData.txt", FileMode.Append, FileAccess.Write);
		SWriter = new StreamWriter(FStream);
		s = s + " CTS File";
		//Writing a string to the file
		SWriter.WriteLine(s);
			SWriter.WriteLine("3rd May 2021");
			//Removing the content from the buffer
			SWriter.Flush();
            SWriter.Close();
            FStream.Close();

        }
		public static void DisplayData(PrintData obj)
	{
		obj("This should go to the");
	}
	public static void Main()
	{
		//Initializing the Delegate object
		PrintData Cn = new PrintData(WriteConsole);
		PrintData Fl = new PrintData(WriteFile);
		//Invoking the DisplayData method with the Delegate object as the argument		
		//Using Delegate
		DisplayData(Cn);
		DisplayData(Fl);
			WriteConsole("Hello");
			WriteFile("This is saved permanently");

		Console.ReadLine();
	}
}

}
