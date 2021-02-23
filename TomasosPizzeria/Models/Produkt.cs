using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace TomasosPizzeria.Models
{
    public partial class Produkt
    {
        public Produkt()
        {
            MatrattProdukts = new HashSet<MatrattProdukt>();
        }

        public int ProduktId { get; set; }
        [Required(ErrorMessage = "Name required")]
        [StringLength(50, ErrorMessage = "Limit 50 characters.")]
        public string ProduktNamn { get; set; }
        [NotMapped]
        public bool IsChecked { get; set; }

        public virtual ICollection<MatrattProdukt> MatrattProdukts { get; set; }
    }
}
