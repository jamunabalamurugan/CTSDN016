using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DelegatesEg
{
	public class PrintToDevice
	{
		//Creating the variables of Stream classes
		static FileStream FStream;
		static StreamWriter SWriter;
		//Defining a Delegate
		public delegate void PrintData(string s);

		//Method to send the string data to respective methods


		//Removing the content from the buffer
		public PrintToDevice()
        {
			SWriter.Flush();
			
		}
 
	
	//Method to print a string to the console
	public static void WriteConsole(string str)
	{
		Console.WriteLine("{0} Console", str);
	}
	//Method to print a string to a file
	public static void WriteFile(string s)
	{
		//Initializing stream objects
		FStream = new FileStream(@"E:\cts\StoreData.txt", FileMode.Append, FileAccess.Write);
		SWriter = new StreamWriter(FStream);
		s = s + " File";
		//Writing a string to the file
		SWriter.WriteLine(s);
            Console.WriteLine("Have added to file");
			SWriter.Close();
			FStream.Close();
		}
	public static void DisplayData(PrintData PMethod)
	{
            Console.WriteLine("Enter your Name");
			string str = Console.ReadLine();
		
		    PMethod(str+" should go to the ");  //Calling the deleagte with a string as a parameter
	}
	public static void Main()
	{
		//Initializing the Delegate object
		PrintData Cn = new PrintData(WriteConsole);
		PrintData Fl = new PrintData(WriteFile);
		//Invoking the DisplayData method with the Delegate object as the argument Using Delegate
		DisplayData(Cn);
		DisplayData(Fl);
		Console.ReadLine();
	}
}

}
