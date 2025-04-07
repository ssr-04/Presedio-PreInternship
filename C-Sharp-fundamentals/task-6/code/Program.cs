//Program.cs
using System;

namespace EventDemo
{
    class Program
    {
        static void Main()
        {
            CounterPublisher publisher = new(threshold: 5);
            CounterSubscriber subscriber = new();

            // Subscribing to the event
            publisher.ThresholdReached += subscriber.AlertHandler;
            publisher.ThresholdReached += subscriber.LogHandler;

            // Increment counter in a loop
            Console.WriteLine("Starting Counter...\n");
            for (int i = 0; i < 10; i++)
            {
                publisher.Increment();
                System.Threading.Thread.Sleep(500); // delay to simulate time
            }

            Console.WriteLine("\n✅Program Ended.");
        }
    }
}
