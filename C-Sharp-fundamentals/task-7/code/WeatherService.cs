using System;
using System.Threading.Tasks;

namespace AsyncFeed
{
    public class WeatherService : IApiService
    {
        public async Task<string> FetchAsync()
        {
            await Task.Delay(1000);

            if(RandomFailure()){
                return "⚠️ Weather API: Something went wrong.";
            }

            return $"🌤️ Weather: Sunny, {RandomWeather()}°C in Coimbatore.";

        } 

        private static bool RandomFailure()
        {
            return new Random().Next(0,5) == 0; //20% chance of failure
        }

        private static int RandomWeather()
        {
            return new Random().Next(30, 40);
        }
    }
}