using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using UdemyCourse.API.CustomActionFilters;
using UdemyCourse.API.Data;
using UdemyCourse.API.Models.Domain;
using UdemyCourse.API.Models.DTO;
using UdemyCourse.API.Repositories;

namespace UdemyCourse.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RegionsController : ControllerBase
    {
        private readonly NZWalksDbContext _context;
        private readonly IRegionRepository _regionRepository;
        private readonly IMapper _mapper;
        public RegionsController(NZWalksDbContext dbContext, IRegionRepository regionRepository,
            IMapper mapper)
        {
            this._context = dbContext;
            this._regionRepository = regionRepository;
            this._mapper = mapper;
        }

        [HttpGet]
        [Authorize(Roles = "Reader")]
        public async Task<IActionResult> GetAll()
        {   
            // Get Data from Database - Domain models
            var regionsDomain = await _regionRepository.GetAllAsync();

            // Map Domain Models to DTOs
            //var regionsDto = new List<RegionDto>();
            //foreach(var regionDomain in regionsDomain)
            //{
            //    regionsDto.Add(new RegionDto()
            //    {
            //        Id = regionDomain.Id,
            //        Name = regionDomain.Name,
            //        Code = regionDomain.Code,
            //        RegionImageUrl = regionDomain.RegionImageUrl
            //    });
            //}

            // Map Domain Models to DTOs
            var regionsDto = _mapper.Map<List<RegionDto>>(regionsDomain);

            // Return DTOs
            return Ok(regionsDto);
        }

        [HttpGet]
        [Route("{id:guid}")]
        [Authorize(Roles = "Reader")]
        public async Task<IActionResult> GetById([FromRoute]Guid id)
        {
            // var regionDomain = _context.Regions.Find(id);

            var regionDomain = await _regionRepository.GetByIdAsync(id);

            if(regionDomain == null)
            {
                return NotFound();
            }

            // Map to region DTO
            //var regionDto = new RegionDto
            //{
            //    Id = regionDomain.Id,
            //    Name = regionDomain.Name,
            //    Code = regionDomain.Code,
            //    RegionImageUrl = regionDomain.RegionImageUrl
            //};

            // Map to region DTO
            var regionDto = _mapper.Map<RegionDto>(regionDomain);

            return Ok(regionDto);
        }

        [HttpPost]
        [Authorize(Roles = "Writer")]
        [ValidateModel]
        public async Task<IActionResult> Create([FromBody] AddRegionRequestDto AddRegionRequestDto)
        {
            // Map DTO to Domain Model
            //var RegionDomainModel = new Region
            //{
            //    Code = AddRegionRequestDto.Code,
            //    Name = AddRegionRequestDto.Name,
            //    RegionImageUrl= AddRegionRequestDto.RegionImageUrl
            //};

            // Map DTO to Domain Model
            var RegionDomainModel = _mapper.Map<Region>(AddRegionRequestDto);

            RegionDomainModel = await _regionRepository.CreateAsync(RegionDomainModel);

            // Map domain back to DTO
            //var RegionDto = new RegionDto
            //{
            //    Id= RegionDomainModel.Id,
            //    Code = RegionDomainModel.Code,
            //    Name = RegionDomainModel.Name,
            //    RegionImageUrl = RegionDomainModel.RegionImageUrl
            //};

            // Map domain back to DTO
            var RegionDto = _mapper.Map<RegionDto>(RegionDomainModel);

            return CreatedAtAction(nameof(GetById), new { id = RegionDto.Id}, RegionDto);
        }

        [HttpPut]
        [Route("{Id:guid}")]
        [Authorize(Roles = "Writer")]
        [ValidateModel]
        public async Task<IActionResult> Update([FromRoute] Guid Id, [FromBody] UpdateRegionRequestDto updateRegionRequestDto)
        {
            // Map DTO to Domain model
            //var regionDomainModel = new Region
            //{
            //    Code = updateRegionRequestDto.Code,
            //    Name = updateRegionRequestDto.Name,
            //    RegionImageUrl = updateRegionRequestDto.RegionImageUrl
            //};

            // Map DTO to Domain model
            var regionDomainModel = _mapper.Map<Region>(updateRegionRequestDto);

            regionDomainModel = await _regionRepository.UpdateAsync(Id, regionDomainModel);

            if (regionDomainModel == null)
            {
                return NotFound();
            }

            //// Map Domain to DTO
            //var regionDto = new RegionDto
            //{
            //    Id = regionDomainModel.Id,
            //    Code = regionDomainModel.Code,
            //    Name = regionDomainModel.Name,
            //    RegionImageUrl = regionDomainModel.RegionImageUrl
            //};

            // Map Domain to DTO
            var regionDto = _mapper.Map<RegionDto>(regionDomainModel);

            return Ok(regionDto);
        }

        [HttpDelete]
        [Route("{Id:guid}")]
        [Authorize(Roles = "Writer")]
        public async Task<IActionResult> Delete([FromRoute] Guid Id)
        {
            var regionDomainModel = await _regionRepository.DeleteAsync(Id);

            if (regionDomainModel == null)
            {
                return NotFound();
            }

            // Map Domain to DTO
            //var regionDto = new RegionDto
            //{
            //    Id = regionDomainModel.Id,
            //    Code = regionDomainModel.Code,
            //    Name = regionDomainModel.Name,
            //    RegionImageUrl = regionDomainModel.RegionImageUrl
            //};

            // Map Domain to DTO
            var regionDto = _mapper.Map<RegionDto>(regionDomainModel);

            return Ok(regionDto);
        }
    }
}
