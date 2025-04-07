using System;
using System.Collections.Generic;

namespace RepositoryDemo
{
    public class InMemoryRepository<T> : IRepository<T> where T : IEntity
    {
        private readonly Dictionary<int, T> _store = [];
        
        public void Add(T item)
        {
            _store[item.Id] = item;
            Console.WriteLine($"[ADD] {typeof(T).Name} with ID {item.Id} added.");
        }

        public T? Get(int id)
        {
            _store.TryGetValue(id, out var item);
            return item;
        }

        public IEnumerable<T> GetAll()
        {
            return _store.Values;
        }

        public void Update(int id, T updatedItem)
        {
            if(_store.ContainsKey(id)){
                _store[id] = updatedItem;
                Console.WriteLine($"[UPDATE] {typeof(T).Name} with ID {id} updated.");
            } else {
                Console.WriteLine($"[ERROR] {typeof(T).Name} with ID {id} not found.");
            }
        }

        public void Delete(int id)
        {
            if(_store.Remove(id)){
                Console.WriteLine($"[DELETE] {typeof(T).Name} with ID {id} deleted.");
            } else {
                Console.WriteLine($"[ERROR] {typeof(T).Name} with ID {id} not found.");
            }
        }
    }
}