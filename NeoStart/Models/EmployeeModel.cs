using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using NeoStart.ValidationCheckbox;

namespace NeoStart.Models
{
    public class EmployeeModel
    {
        public int RowId { get; set; }

        [Required(ErrorMessage = "Enter the Employee Code")]
        [StringLength(6, MinimumLength = 6, ErrorMessage = "Employee Code must be exactly 6 characters long.")]
        public string EmployeeCode { get; set; }


        [Required(ErrorMessage = "Enter the First Name")]
        [MaxLength(12, ErrorMessage = "Name Should be Less than 12 Words")]
        [RegularExpression(@"^[A-Za-z\s]+$", ErrorMessage = "First Name should only contain letters and spaces.")]
        public string FirstName { get; set; }


        [Required(ErrorMessage = "Enter the First Name")]
        [MaxLength(12, ErrorMessage = "Name Should be Less than 12 Words")]
        [RegularExpression(@"^[A-Za-z\s]+$", ErrorMessage = "Last Name should only contain letters and spaces.")]
        public string LastName { get; set; }

        [DisplayName("Country")]

        [Required(ErrorMessage = "Choose the Country")]
        public int CountryId { get; set; }

        [DisplayName("State")]
        [Required(ErrorMessage = "Choose the State")]
        public int StateId { get; set; }

        [DisplayName("City")]
        [Required(ErrorMessage = "Choose the Last City")]
        public int CityId { get; set; }

        [Required(ErrorMessage = "Enter the Email ID")]
        [EmailAddress(ErrorMessage = "Enter the Correct Email")]
        public string EmailAddress { get; set; }

        [RegularExpression("^[6789]\\d{9}$", ErrorMessage = "Enter the Correct Mobile Number")]
        public string MobileNumber { get; set; }

        [RegularExpression("^[A-Z]{1}[0-9]{7,8}$", ErrorMessage = "Enter a Valid Passport Number (e.g., A12345678)")]
        [StringLength(9, MinimumLength = 8, ErrorMessage = "Passport Number must be between 8 and 9 characters.")]
        public string PassportNumber { get; set; }

        [Required(ErrorMessage = "Enter the PAN Number")]
        [RegularExpression(@"^[A-Z]{5}[0-9]{4}[A-Z]{1}$", ErrorMessage = "Invalid PAN Number format. It should be in the format XXXXX9999X (e.g., CVCPA7555H).")]
        public string PanNumber { get; set; }

        [Required(ErrorMessage = "Upload the Image")]
        public string ProfileImage { get; set; }

        [DisplayName("Upload Image")]
        public IFormFile? UploadImage { get; set; }

        [Required(ErrorMessage = "Kindly Select The Gender")]
        public Gender Gender { get; set; }

        [Required(ErrorMessage = "Kindly Choose The D.O.B")]
        [DataType(DataType.Date)]
        [AgeAndFutureDateValidationAttribute(ErrorMessage ="Minimum Age Should be 18 Years")]

        public DateOnly DateOfBirth { get; set; }

        [Required(ErrorMessage = "Kindly Choose The Joining Date")]
        [DataType(DataType.Date)]
        //[DateLessThanToday(ErrorMessage = "Date of Joining must be less than or equal to today's date.")]
        public DateOnly DateOfJoinee { get; set; }

        public DateTime CreatedDate { get; set; }

        [Required(ErrorMessage = "Please tick the box to accept the terms.")]
        [ValidateCheckBoxes(ErrorMessage = "Please tick the box to accept the terms.")]
        public bool IsActive { get; set; }
    }

    public enum Gender
    {
        Male = 1,
        Female = 2
    }
}
