using BooksApi.Models;
using Microsoft.EntityFrameworkCore;

namespace BooksApi.Data
{
    public class BooksDbContext(DbContextOptions<BooksDbContext> options) : DbContext(options)
    {
        public DbSet<Book> Books => Set<Book>();
    }
}
