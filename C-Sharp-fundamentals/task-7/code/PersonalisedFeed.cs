using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace AsyncFeed
{
    public class PersonalisedFeed(List<IApiService> services)
    {
        private readonly List<IApiService> _services = services;

        public async Task DisplayFeedAsync()
        {
            var tasks = new List<Task<string>>();

            foreach(var service in _services)
            {
                tasks.Add(service.FetchAsync());
            }

            var results = await Task.WhenAll(tasks);

            Console.WriteLine("\n📬 Personalized Feed:\n");

            foreach(var result in results)
            {
                Console.WriteLine(result);
            }
        }
    }
}