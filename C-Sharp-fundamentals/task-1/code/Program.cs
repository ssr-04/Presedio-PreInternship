using System;

class FactorialCalculator
{
    /// <summary>
    /// Main method - Entry point of the program
    /// </summary>
    static void Main()
    {
        Console.Write("Enter a positive number: ");

        // Read and validate user input
        if (int.TryParse(Console.ReadLine(), out int number) && number >= 0)
        {
            long factorial = CalculateFactorial(number);
            Console.WriteLine($"Factorial of {number} is {factorial}");
        }
        else
        {
            Console.WriteLine("Invalid input! Please enter a non-negative integer.");
        }
    }

    /// <summary>
    /// Calculates factorial using iteration
    /// </summary>
    /// <param name="n">Non-negative integer</param>
    /// <returns>Factorial of the given number</returns>
    static long CalculateFactorial(int n)
    {
        long result = 1;

        for (int i = 2; i <= n; i++)
        {
            result *= i;
        }

        return result;
    }
}
