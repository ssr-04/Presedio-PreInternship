using System.Threading.Tasks;

namespace AsyncFeed
{
    public interface IApiService
    {
        Task<string> FetchAsync();
    }
}