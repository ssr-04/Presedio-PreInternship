using System;
using System.Linq;
using System.Reflection;

namespace DevAutomation
{
    public class AutomationRunner
    {
        public void RunAll()
        {
            Console.WriteLine("🔍 Scanning for [Runnable] tasks...\n");

            var methods = Assembly.GetExecutingAssembly()
            .GetTypes()
            .SelectMany(t => t.GetMethods(BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic))
            .Where(m => m.GetCustomAttribute<RunnableAttribute>() != null);


            foreach(var method in methods)
            {
                var attribute = method.GetCustomAttribute<RunnableAttribute>();
                Console.WriteLine($"▶️ Running: {method.Name} — {attribute?.Description}");

                try {
                    method.Invoke(null, null);
                } catch (Exception e) {
                    Console.WriteLine($"❗ Error running {method.Name}: {e.Message}");
                }

                Console.WriteLine();
            }

            Console.WriteLine("✅ All runnable tasks executed.");
        }
    }
}