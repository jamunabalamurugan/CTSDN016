using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prjFirstApp
{
    struct Books
    {
        private string title;
        private string author;
        private string subject;
        private int book_id;

        public void getValues(string title, string a, string s, int id)
        {
            this.title = title;
            author = a;
            subject = s;
            book_id = id;
        }

        public void display()
        {
            Console.WriteLine("Title : {0}", title);
            Console.WriteLine("Author : {0}", author);
            Console.WriteLine("Subject : {0}", subject);
            Console.WriteLine("Book_id :{0}", book_id);
        }
    };

    public class BooksProgram
    {

        public static void Main(string[] args)
        {
            Books book1 = new Books();   /* Declare book1 of type Book */
            Books book2 = new Books();   /* Declare book2 of type Book */

            /* book 1 specification */
            book1.getValues("C Programming",
            "Nuha Ali", "C Programming Tutorial", 6495407);

            /* book 2 specification */
            book2.getValues("Telecom Billing",
            "Zara Ali", "Telecom Billing Tutorial", 6495700);

            /* print Book1 info */
            book1.display();

            /* print Book2 info */
            book2.display();

            Console.ReadKey();
        }
    }

}