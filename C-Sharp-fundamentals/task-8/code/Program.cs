using System;
using RepositoryDemo;

namespace RepositoryDemo
{
    public class Product : IEntity
    {
        public int Id { get; set; }
        public string Name { get; set; } = "";
        public double Price {get; set; }

        public override string ToString()
        {
            return $"ID: {Id}, Name: {Name}, Price: ₹{Price}";
        }
    }

    class Program
    {
        static void Main() 
        {
            InMemoryRepository<Product> repo = new();

            // Adding Products
            repo.Add(new Product {Id = 101, Name = "Laptop", Price = 60000});
            repo.Add(new Product {Id = 102, Name = "Mouse", Price = 500});
            repo.Add(new Product {Id = 103, Name = "Keyboard", Price = 1200});

            Console.WriteLine("\n📦 All Products:");

            foreach(var p in repo.GetAll())
            {
                Console.WriteLine(p);
            }

            Console.WriteLine();
            // Update Product
            repo.Update(102, new Product { Id = 102, Name = "Wireless Mouse", Price = 700 });

            // Delete Product
            repo.Delete(103);

            Console.WriteLine("\n📦 Updated Product List:");

            foreach (var p in repo.GetAll())
            {
                Console.WriteLine(p);
            }

            // Try getting a product
            var product = repo.Get(101);
            Console.WriteLine($"\n🔍 Get Product with ID 101: {product}");

        }
    }
}