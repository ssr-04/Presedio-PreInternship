using Microsoft.OpenApi.Models;
using BooksApi.Data;
using Microsoft.EntityFrameworkCore;
using BooksApi.Services;
using BooksApi.Middlewares; 

var builder = WebApplication.CreateBuilder(args);

// Add services to the container
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "Books API", Version = "v1" });
});
builder.Services.AddControllers();
builder.Services.AddDbContext<BooksDbContext>(options =>
    options.UseInMemoryDatabase("BooksDb"));
builder.Services.AddScoped<IBookService, BookService>();


var app = builder.Build();

// Enable Swagger middleware
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(c =>
    {
        c.SwaggerEndpoint("/swagger/v1/swagger.json", "Books API V1");
    });
}

app.UseHttpsRedirection();

app.UseMiddleware<ErrorHandlingMiddleware>(); 

app.MapControllers();

app.Run();

