using BooksApi.Models;

namespace BooksApi.Services
{
    public interface IBookService
    {
        Task<IEnumerable<Book>> GetAllAsync();
        Task<Book?> GetByIdAsync(Guid id);
        Task<Book> AddAsync(Book book);
        Task<bool> UpdateAsync(Guid id, Book updatedBook);
        Task<bool> DeleteAsync(Guid id);
    }

}
