using System.ComponentModel.DataAnnotations;

namespace UdemyCourse.API.Models.DTO
{
    public class AddRegionRequestDto
    {
        [Required]
        [MinLength(3, ErrorMessage = "Code has to be minimum 3 charcters")]
        [MaxLength(3, ErrorMessage = "Code has to be maximum 3 charcters")]
        public required string Code { get; set; }

        [Required]
        [MaxLength(50, ErrorMessage = "Name has to be less than 50 charcters")]
        public required string Name { get; set; }

        public string? RegionImageUrl { get; set; }
    }
}
