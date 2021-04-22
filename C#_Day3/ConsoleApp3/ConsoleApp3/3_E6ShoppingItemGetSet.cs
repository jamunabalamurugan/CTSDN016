using System;


    class ShoppingItem
    {
        
       private string Category;
        private string nm;
        private string sz;
        private decimal price;


       
        // A property for the name of an item
        public string Name
        {
            get
            {
                return nm;
            }

            set
            {
                if (nm == "")
                    nm = "Item no Description";
                else
                    nm = value;
            }
        }

        // A property for size of a merchandise
        public string Size
        {
            get
            {
                return sz;
            }

            set
            {
                sz = value;
            }
        }

        // A property for the marked price of an item
        public decimal UnitPrice
        {
            get
            {
                return price;
            }

            set
            {
                if (price < 0)
                    price = 0.00M;
                else
                    price = value;
            }
        }

        public static ShoppingItem Read()
        {
            
            ShoppingItem shop = new ShoppingItem();

          
         string cat;
            Console.WriteLine("Store Items Categories");
            Console.WriteLine("\t1. Women");
            Console.WriteLine("\t2. Men");
            Console.WriteLine("\t3. Girls");
            Console.WriteLine("\t4. Boys");
            Console.WriteLine("\t5. Babies");
            Console.Write("Enter the Category (1-5): ");
            cat = Console.ReadLine();
            if (cat == "1")
                shop.Category = "Women";
            else if (cat == "2")
                shop.Category = "Men";
            else if (cat == "3")
                shop.Category = "Girls";
            else if (cat == "4")
                shop.Category = "Boys";
            else if (cat == "5")
                shop.Category = "Babies";
	    else 
		{
	    	  Console.WriteLine("Invalid item category");
		  Console.ReadLine();
	   	  System.Environment.Exit(0);
		}     
 
            Console.Write("Item Name:  ");
            shop.Name = Console.ReadLine();
            Console.Write("Number of units:  ");
            shop.Size = Console.ReadLine();
            Console.Write("Unit Price: ");
            shop.UnitPrice = decimal.Parse(Console.ReadLine());

            return shop;
        }

        public static void Write(ShoppingItem item)
        {
            Console.WriteLine();
            Console.WriteLine("Category:    {0}", item.Category);
            Console.WriteLine("Description: {0}", item.Name);
            Console.WriteLine("Number of units:   {0}", item.Size);
            Console.WriteLine("Unit Price:  {0:C}", item.UnitPrice);
        }
        public static void Main(string []args)
                {
            ShoppingItem si =new ShoppingItem();
                    si=ShoppingItem.Read();
                    ShoppingItem.Write(si);
		    Console.ReadLine();
                }
    }
