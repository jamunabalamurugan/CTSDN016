using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise1              //DO NOT change the namespace name
{
    public class BookUtil         //DO NOT change the class name 
    {
        LibraryContext db=new LibraryContext(); 
        public Book AddBook(Book book)    //DO NOT change the method Name and Signature
        {
            //Implement code to insert the book entity to database
            
            db.Books.Add(book);
            db.SaveChanges();
            Console.WriteLine("Details Added Successfully");
            return book;
           
        }


        public List<Book> GetBookByGenre(string Genre)   //DO NOT change the method Name and Signature
        {
            //Implement code to get the book entity from database based on Genre
               string g=Genre;
               List<Book> blist= db.Books.Where(book=> book.BookGenre==g).ToList();
               if(blist!=null)
                    return blist;
                return null;
        }
        
        public List<Book> GetBooksList() //DO NOT change the method Name and Signature
        {
             //Implement code to get the book list from database
             return db.Books.ToList();
        }
        public Book UpdateBookPrice(int NewPrice,int Bookid)   //DO NOT change the method Name and Signature
        {
             //Implement code to update the book entity 
             Book obj=db.Books.Find(Bookid);
             if(obj!=null)
             {
                 obj.BookPrice=NewPrice;
                // db.Entry(obj).State=EntityState.Modified;
                 db.SaveChanges();
                 return obj;
                 
             }
             return null;
        }

        public Book DeleteBook(int BookId)  //DO NOT change the method Name and Signature
        {
            //Implement code to delete the book entity by Id
            Book obj=db.Books.Find(BookId);
            if(obj!=null)
            {
                db.Books.Remove(obj);
                db.SaveChanges();
                return obj;
            }
            
            return null;
        }

    }
}
