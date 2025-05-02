using System;
using System.Collections.Generic;

class ListManager
{
    static ItemService itemService = new ItemService();

    static void Main()
    {
        while (true)
        {
            Console.WriteLine("\nOptions");
            Console.WriteLine("1. Add Item");
            Console.WriteLine("2. Remove Item");
            Console.WriteLine("3. Display Items");
            Console.WriteLine("4. Exit");
            Console.Write("Choose an option: ");

            string choice = (Console.ReadLine() ?? string.Empty).Trim();

            switch (choice)
            {
                case "1":
                    itemService.AddItem();
                    break;
                case "2":
                    itemService.RemoveItem();
                    break;
                case "3":
                    itemService.DisplayItems();
                    break;
                case "4":
                    Console.WriteLine("Exiting program...");
                    return;
                default:
                    Console.WriteLine("Invalid choice. Please try again.");
                    break;
            }
        }
    }
}

class ItemService
{
    private List<string> items = new List<string>();

    public void AddItem()
    {
        Console.Write("Enter Item to add: ");
        string item = (Console.ReadLine() ?? string.Empty).Trim();

        if (!string.IsNullOrWhiteSpace(item))
        {
            items.Add(item);
            Console.WriteLine($"Added: {item.ToUpper()}");
        }
        else
        {
            Console.WriteLine("Item cannot be empty.");
        }
    }

    public void RemoveItem()
    {
        Console.Write("Enter item name to remove: ");
        string item = (Console.ReadLine() ?? string.Empty).Trim();

        if (!string.IsNullOrWhiteSpace(item) && items.Remove(item))
        {
            Console.WriteLine($"Removed: {item.ToUpper()}");
        }
        else
        {
            Console.WriteLine("Item not found.");
        }
    }

    public void DisplayItems()
    {
        if (items.Count == 0)
        {
            Console.WriteLine("The list is empty.");
        }
        else
        {
            for (int i = 0; i < items.Count; i++)
                Console.WriteLine($"{i + 1}. {items[i].ToUpper()}");
        }
    }
}