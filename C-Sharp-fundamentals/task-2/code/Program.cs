using System;

/// <summary>
/// Constructor to initialize the Person Object.
/// </summary>
/// <param name="name"> Person's name </param>
/// <param name="age"> Person's age </param>
class Person(string name, int age) //Modern convention instead of having seperate constructor
{
    /// <summary>
    /// Gets or sets the name of a person.
    /// </summary>
    public string Name { get; set; } = name;

    /// <summary>
    /// Gets or sets the age of a person.
    /// </summary>
    public int Age { get; set; } = age;

    /// <summary>
    /// Introduces the person with a greeting
    /// </summary>
    public void Introduce(){
        Console.WriteLine($"Hello, my name is {Name}, I am {Age} years old");
    }
}

class Program
{
    /// <summary>
    /// Entry point of the program.
    /// </summary>
    static void Main(){

        // Creating Person Objects
        Person person1 = new("Ram", 25); // Modern convention when using new
        Person person2 = new("Som", 30);
        Person person3 = new("Jack", 22);

        // Calling Introduce method on each person
        person1.Introduce();
        person2.Introduce();
        person3.Introduce();
    }
}