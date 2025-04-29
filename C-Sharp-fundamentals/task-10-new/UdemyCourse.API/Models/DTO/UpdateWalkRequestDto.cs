using System.ComponentModel.DataAnnotations;

namespace UdemyCourse.API.Models.DTO
{
    public class UpdateWalkRequestDto
    {
        [Required]
        [MaxLength(100, ErrorMessage = "The Walk name should be less than 100 characters")]
        public required string Name { get; set; }

        [Required]
        [MaxLength(1000, ErrorMessage = "The Walk description should be less than 1000 characters")]
        public required string Description { get; set; }

        [Required]
        [Range(0, 5, ErrorMessage = "Distance should be between 0 to 5km")]
        public required double LengthInKm { get; set; }

        public string? WalkImageUrl { get; set; }

        [Required]
        public Guid DifficultyID { get; set; }
        [Required]
        public Guid RegionId { get; set; }
    }
}
