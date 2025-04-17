namespace BooksApi.Models
{
    public class Book
    {
        public Guid Id { get; set; } // Primary Key
        public required string Title { get; set; }
        public required string Author { get; set; }
        public required int Year { get; set; }
    }
}
