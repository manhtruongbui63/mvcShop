using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace OnlineShop.Models
{
    public class RegisterModels
    {
        [Key]
        public long ID { get; set; }

        [Display(Name="UserName")]
        [Required(ErrorMessage ="Please enter a valid username")]
        public string UserName { get; set; }

        [Display(Name = "Password")]
        [StringLength(32,MinimumLength =6,ErrorMessage ="Password must contain at least 6 characters")]
        [Required(ErrorMessage = "Please enter a valid password")]
        public string Password { get; set; }

        [Display(Name = "Name")]
        [Required(ErrorMessage = "Please enter a valid name")]
        public string Name { get; set; }

        [Display(Name = "Email")]
        [Required(ErrorMessage = "Please enter a valid email")]
        public string Email { get; set; }

        [Display(Name = "Address")]
        [Required(ErrorMessage = "Please enter a valid address")]
        public string Address { get; set; }

        [Display(Name = "Phone Number")]
        [Required(ErrorMessage = "Please enter a valid phone number")]
        public string Phone { get; set; }
    }
}