using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



    namespace WorkwithIndexers
    {
        public class Flower
        {
            string name;
            string color;
            public Flower(string name, string color)
            {
                this.name = name;
                this.color = color;
            }
            public void Display()
            {
                Console.WriteLine(name + " " + "in  " + color + " color");
            }

        }
        class Flowervase
        {
            Flower[] ob = new Flower[10];
            public Flower this[int pos]
            {
                get { return ob[pos]; }
                set { ob[pos] = value; }
            }
            static void Main()
            {
                Flowervase fv = new Flowervase();
                fv[0] = new Flower("Rose", "Red");
                fv[1] = new Flower("Lillty", "White");
                fv[2] = new Flower("Rose", "Pink");
                for (int i = 0; i < 3; i++)
                {
                    fv[i].Display();
                }
                Console.Read();
            }
        }
    }


