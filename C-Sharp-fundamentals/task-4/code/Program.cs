using System;
using System.Collections.Generic;
using System.Linq;

/// <summary>
/// Represents a student with name, grade and age.
/// </summary>
class Student(string name, double grade, int age)
{

    public string Name { get; set; } = name;
    public double Grade { get; set; } = grade;
    public int Age { get; set; } = age;

    /// <summary>
    /// Prints student details with formatting
    /// </summary>
    public void PrintInfo() {
        Console.WriteLine($"Name: {Name}\t Grade: {Grade}\t Age: {Age}");
    }
}

class Program{

    static void Main() {
        
        // Sample data
        List<Student> students =
        [
            new Student("Ram", 88.5, 20),
            new Student("Anita", 92.3, 21),
            new Student("Karan", 76.0, 19),
            new Student("Priya", 67.2, 22),
            new Student("Dev", 88.5, 20),
            new Student("Sneha", 73.5, 21)
        ];

        // defining grade threshold
        double threshold = 70;

        //LINQ: Filtering and sorting based on the Grade
        var filteredAndSorted = students
            .Where(s => s.Grade >= threshold)
            .OrderByDescending(s => s.Grade)
            .ThenBy(s => s.Name);

        Console.WriteLine($"\n📚 Students with Grade > {threshold} (sorted by Grade):\n");

        foreach(var student in filteredAndSorted){
            student.PrintInfo();
        }

    }
}