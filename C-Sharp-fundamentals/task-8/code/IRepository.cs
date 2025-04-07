using System.Collections.Generic;

namespace RepositoryDemo
{
    public interface IRepository<T>
    {
        void Add(T item);
        T? Get(int id);
        IEnumerable<T> GetAll();
        void Update(int id, T updatedItem);
        void Delete(int id);
    }

    public interface IEntity
    {
        int Id { get; set; }
    }
}