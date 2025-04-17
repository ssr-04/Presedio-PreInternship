using BooksApi.Models;
using BooksApi.Data;
using Microsoft.Extensions.Logging;
using Microsoft.EntityFrameworkCore;

namespace BooksApi.Services
{

    public class BookService(BooksDbContext context, ILogger<BookService> logger) : IBookService
    {
        private readonly BooksDbContext _context = context;
        private readonly ILogger<BookService> _logger = logger;

        public async Task<IEnumerable<Book>> GetAllAsync()
        {
            _logger.LogInformation("Fetching all books from the database.");
            return await _context.Books.ToListAsync();
        }

        public async Task<Book?> GetByIdAsync(Guid id)
        {
            _logger.LogInformation("Fetching book with ID {BookId}.", id);
            return await _context.Books.FindAsync(id);
        }

        public async Task<Book> AddAsync(Book book)
        {
            _logger.LogInformation("Adding a new book: {Title} by {Author}", book.Title, book.Author);
            _context.Books.Add(book);
            await _context.SaveChangesAsync();
            return book;
        }

        public async Task<bool> UpdateAsync(Guid id, Book updatedBook)
        {
            var book = await _context.Books.FindAsync(id);
            if (book == null)
            {
                _logger.LogWarning("Attempted to update non-existing book with ID {BookId}", id);
                return false;
            }

            book.Title = updatedBook.Title;
            book.Author = updatedBook.Author;
            book.Year = updatedBook.Year;

            _logger.LogInformation("Updating book with ID {BookId}", id);
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<bool> DeleteAsync(Guid id)
        {
            var book = await _context.Books.FindAsync(id);
            if (book == null)
            {
                _logger.LogWarning("Attempted to delete non-existing book with ID {BookId}", id);
                return false;
            }

            _context.Books.Remove(book);
            _logger.LogInformation("Deleted book with ID {BookId}", id);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
