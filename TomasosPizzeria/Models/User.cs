using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TomasosPizzeria.Models
{
    public class User
    {
        [Required(ErrorMessage = "Username required")]
        [StringLength(256, ErrorMessage = "Limit 256 characters.")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Email required")]
        [StringLength(256, ErrorMessage = "Limit 256 characters.")]
        [EmailAddress(ErrorMessage = "Not a valid email")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Password required")]
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{8,}$", ErrorMessage = "8 characters, Upper case, Lower case, Numbers, Special")]
        public string Password { get; set; }
        [StringLength(50, ErrorMessage = "Limit 50 characters.")]
        public string Gatuadress { get; set; }
        [StringLength(100, ErrorMessage = "Limit 100 characters.")]
        public string Namn { get; set; }
        [StringLength(20, ErrorMessage = "Limit 20 characters.")]
        [RegularExpression("^[0-9]*$", ErrorMessage = "May only contain numbers")]
        public string Postnr { get; set; }
        [StringLength(100, ErrorMessage = "Limit 100 characters.")]
        public string Postort { get; set; }
        [RegularExpression("^[0-9]*$", ErrorMessage = "May only contain numbers")]
        public string Phone { get; set; }
    }
}
