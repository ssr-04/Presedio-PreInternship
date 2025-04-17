using Microsoft.AspNetCore.Mvc;
using BooksApi.Models;
using BooksApi.Services;

namespace BooksApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class BooksController(IBookService bookService, ILogger<BooksController> logger) : ControllerBase
    {
        private readonly IBookService _bookService = bookService;
        private readonly ILogger<BooksController> _logger = logger;

        [HttpGet]
        public async Task<IActionResult> GetAllBooks()
        {
            _logger.LogInformation("GET /api/books called.");
            var books = await _bookService.GetAllAsync();
            return Ok(books);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetBookById(Guid id)
        {
            _logger.LogInformation("GET called with id: {Id}", id);
            var book = await _bookService.GetByIdAsync(id);
            if (book == null)
            {
                _logger.LogWarning("Book with ID {Id} not found.", id);
                return NotFound();
            }
            return Ok(book);
        }

        [HttpPost]
        public async Task<IActionResult> CreateBook([FromBody] Book book)
        {
            _logger.LogInformation("POST /api/books called.");
            var created = await _bookService.AddAsync(book);
            return CreatedAtAction(nameof(GetBookById), new { id = created.Id }, created);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateBook(Guid id, [FromBody] Book updatedBook)
        {
            _logger.LogInformation("PUT called with id: {id}", id);
            var result = await _bookService.UpdateAsync(id, updatedBook);
            if (!result)
            {
                _logger.LogWarning("Failed to update book with ID {Id}", id);
                return NotFound();
            }
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBook(Guid id)
        {
            _logger.LogInformation("DELETE called with id: {id}", id);
            var result = await _bookService.DeleteAsync(id);
            if (!result)
            {
                _logger.LogWarning("Failed to delete book with ID {Id}", id);
                return NotFound();
            }
            return NoContent();
        }
    }
}
