using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using MoviesManagement.Models;
using System.Data.SqlClient;

namespace MoviesManagement.DatabaseContext
{
    public class MovieDbContext : DbContext
    {
        public MovieDbContext()
            : base("DefaultConnection")
        {

        }
        public DbSet<Movie> Movies { get; set; }
        public DbSet<Genre> Genres { get; set; }
    }
}