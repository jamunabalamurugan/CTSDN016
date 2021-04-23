using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prjFirstApp
{
    class NullableData
    {
        static void Main()
        {
            int? TicketsonSale = null;//null data type for an int
            
            string str1 = null;//Reference type can only have null values
            char? c = null;//Value type cannot store null

            int Availabletickets;
            if (TicketsonSale == null)
            {
                Availabletickets = 0;
            }
            else
            {
                Availabletickets =(int)TicketsonSale; //or
                 //Availabletickets = TicketsonSale.Value;
            }
            Console.WriteLine("AvailableTickets ={0}", Availabletickets);
        }

    }
}
