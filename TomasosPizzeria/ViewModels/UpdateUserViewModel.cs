using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TomasosPizzeria.Models;

namespace TomasosPizzeria.ViewModels
{
    public class UpdateUserViewModel
    {
        public string Email { get; set; }
        public string Gatuadress { get; set; }
        public string Namn { get; set; }
        public string Postnr { get; set; }
        public string Postort { get; set; }
        public string Phone { get; set; }
    }
}
