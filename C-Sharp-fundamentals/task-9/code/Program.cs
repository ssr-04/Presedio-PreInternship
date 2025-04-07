using System;
using DevAutomation;

namespace DevAutomation
{
    class Program
    {
        static void Main()
        {
            Console.WriteLine("🛠️ Developer Automation Task Runner\n");

            var runner = new AutomationRunner();
            runner.RunAll();
        }
    }
}