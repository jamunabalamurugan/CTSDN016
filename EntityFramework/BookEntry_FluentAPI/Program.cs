using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise1   //DO NOT change the namespace name
{
    public class Program   //DO NOT change the class name
    {
        static void Main(string[] args)      //DO NOT change the 'Main' method signature
        {
            //Implement code here
            Book book=new Book();
            Console.WriteLine("Enter Book Name");
            book.BookName=Console.ReadLine();
            Console.WriteLine("Enter Book Author");
            book.BookAuthor=Console.ReadLine();
            Console.WriteLine("Enter Book Genre");
            book.BookGenre=Console.ReadLine();
            Console.WriteLine("Enter Book Price");
            book.BookPrice=double.Parse(Console.ReadLine());
            
            BookUtil bUtil=new BookUtil();
            bUtil.AddBook(book);
            
            Book book1=new Book();
            Console.WriteLine("Enter Book Name");
            book.BookName=Console.ReadLine();
            Console.WriteLine("Enter Book Author");
            book.BookAuthor=Console.ReadLine();
            Console.WriteLine("Enter Book Genre");
            book.BookGenre=Console.ReadLine();
            Console.WriteLine("Enter Book Price");
            book.BookPrice=double.Parse(Console.ReadLine());
            
            bUtil.AddBook(book1);
            
            
            Console.WriteLine("Get Book Details By Genre");
            string Genre=Console.ReadLine();
            var books=bUtil.GetBookByGenre(Genre);
            //bUtil.GetBookByGenre(Genre);
            foreach(var item in books)
            {
                Console.WriteLine(item.BookName+"-"+item.BookAuthor);
            }
            
            Console.WriteLine("Get Book List");
            int count=1;
            foreach(var item in bUtil.GetBooksList())
            {
                Console.WriteLine(item.BookAuthor+"--"+(count++));
            }
        }
    }
}
