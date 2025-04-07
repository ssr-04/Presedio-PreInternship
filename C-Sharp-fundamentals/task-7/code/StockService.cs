using System;
using System.Threading.Tasks;

namespace AsyncFeed
{
    public class StockService : IApiService
    {
        private static List<string> stocks = ["AAPL", "MSFT", "GOOGL", "AMZN", "TSLA", "FB", "NVDA","JPM"];
        
        public async Task<string> FetchAsync(){

            await Task.Delay(2000); // Simulated delay

            if(RandomFailure())
            {
                return "⚠️ Stock API: Something went wrong.";
            }

            return RandomiseStocks();
        }

        public static bool RandomFailure()
        {
            return new Random().Next(0,3) == 0; //33.33% chance of failure
        }

        public static string RandomiseStocks()
        {
            Random generator = new ();
            int RandomIdx = generator.Next(stocks.Count);
            string StockSymbol = stocks[RandomIdx];
            double RandomPrice = generator.Next(100, 1000) * 1.25;
            double RandomIncrease = generator.Next(5,20) * 1.4;
            return $"📈 Stock: {StockSymbol} ₹{RandomPrice:F2} ↑{RandomIncrease:F2}%";
        }
    }
}