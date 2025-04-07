// CounterSubscriber.cs

using System;

namespace EventDemo
{
    public class CounterSubscriber
    {
        public void AlertHandler(object sender, EventArgs e)
        {
            Console.WriteLine("\n[Subscriber] 🔔 Alert: Counter threshold reached!");
        }

        public void LogHandler(object sender, EventArgs e)
        {
            Console.WriteLine("[Subscriber] 📝 Log: Threshold event handled and logged.\n");
        }
    }
}
