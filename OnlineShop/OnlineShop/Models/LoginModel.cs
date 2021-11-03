using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace OnlineShop.Models
{
    public class LoginModel
    {
        [Key]
        [Display(Name="UserName")]
        [Required(ErrorMessage = "Please enter a valid username")]
        public string UserName { get;set; }

        [Display(Name ="Password")]
        [Required(ErrorMessage = "Please enter a valid password")]
        public string Password { get; set; }
    }
}