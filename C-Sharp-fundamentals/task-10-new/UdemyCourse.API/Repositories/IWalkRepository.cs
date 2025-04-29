﻿using UdemyCourse.API.Models.Domain;

namespace UdemyCourse.API.Repositories
{
    public interface IWalkRepository
    {
        Task<Walk> CreateAsync(Walk walk);

        Task<List<Walk>> GetAllAsync(string? filterOn = null, string? filterQuery = null, string? sortBy = null, bool isAscending = true, int pageNumber = 1, int pageSize = 5);

        Task<Walk?> GetByIdAsync(Guid Id);

        Task<Walk?> UpdateAsync(Guid Id, Walk walk);

        Task<Walk?> DeleteAsync(Guid Id);
    }
}
