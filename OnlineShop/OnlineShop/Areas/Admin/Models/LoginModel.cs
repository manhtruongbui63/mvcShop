using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace OnlineShop.Areas.Admin.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage ="Enter username")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "Enter password")]
        public string PassWord { get; set; }
    }
}