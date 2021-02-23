using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TomasosPizzeria.Models;

namespace TomasosPizzeria.ViewModels
{
    public class ManageRolesViewModel
    {
        public List<AspNetUser> Users { get; set; }
        public List<AspNetUserRole> UserRoles { get; set; }
        public List<AspNetRole> Roles { get; set; }
        public ManageRolesViewModel()
        {
            Users = new();
            UserRoles = new();
            Roles = new();
        }
    }
}
