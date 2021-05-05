using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prjDLLDemo
{
    public class Card
    {
        public bool Validate(string cardno)
        {
            if (cardno.Length == 16) { return true; }
            else { return false; }
        
        }
    }
}
