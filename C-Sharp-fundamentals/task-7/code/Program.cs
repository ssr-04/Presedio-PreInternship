using System;
using AsyncFeed;

namespace AsyncFeed
{
    class Program
    {
        static async Task Main()
        {
            Console.WriteLine("🔄 Fetching your personalized feed. Please wait...\n");

            var services = new List<IApiService>
            {
                new WeatherService(),
                new StockService(),
                new NewsService()
            };

            var feed = new PersonalisedFeed(services);

            await feed.DisplayFeedAsync();

            Console.WriteLine("\n✅ Done.");
        }
    }
}