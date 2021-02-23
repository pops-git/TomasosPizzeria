using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace TomasosPizzeria.Models
{
    public class LoginUser
    {
        [Required(ErrorMessage = "Username required")]
        [StringLength(256, ErrorMessage = "Limit 256 characters.")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Password required")]
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{8,}$", ErrorMessage = "8 characters, Upper case, Lower case, Numbers, Special")]
        public string Password { get; set; }
    }
}
