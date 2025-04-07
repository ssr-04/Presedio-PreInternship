using System;
using System.Threading.Tasks;

namespace AsyncFeed
{
    public class NewsService : IApiService
    {
        public async Task<string> FetchAsync()
        {
            await Task.Delay(1700); // Simulate API delay

            if(RandomFailure()){
               return "⚠️ News API: Something went wrong.";
            }

            return "📰 News: AI revolutionizes healthcare diagnostics.";
        }

        public static bool RandomFailure()
        {
            return new Random().Next(0,10) == 0; //10% chance of failure
        }
    }
}