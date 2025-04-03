using System;

class ListManager
{
    static List<string> items = [];

    static void Main() {

        while(true){
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
                    AddItem();
                    break;
                case "2":
                    RemoveItem();
                    break;
                case "3":
                    DisplayItems();
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

    static void AddItem() {

        Console.Write("Enter Item to add: ");
        string item = (Console.ReadLine() ?? string.Empty).Trim();

        if(!string.IsNullOrWhiteSpace(item)){
            items.Add(item);
            Console.WriteLine($"Added: {item.ToUpper()}");
        } else {
            Console.WriteLine("Item cannot be empty.");
        }
    }

    static void RemoveItem() {

        Console.Write("Enter item name to remove: ");
        string item = (Console.ReadLine() ?? string.Empty).Trim();

        if(!string.IsNullOrWhiteSpace(item) && items.Remove(item)){
            Console.WriteLine($"Removed: {item.ToUpper()}");
        } else {
            Console.WriteLine("Item not found.");
        }
    }

    static void DisplayItems() {
        if(items.Count == 0) {
            Console.WriteLine("The list is empty.");
        } else {
            for(int i = 0; i < items.Count; i++)
            Console.WriteLine($"{i + 1}. {items[i].ToUpper()}");
        }
    }
}