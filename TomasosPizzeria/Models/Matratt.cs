using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace TomasosPizzeria.Models
{
    public partial class Matratt
    {
        public Matratt()
        {
            BestallningMatratts = new HashSet<BestallningMatratt>();
            MatrattProdukts = new HashSet<MatrattProdukt>();
        }

        public int MatrattId { get; set; }
        [Required(ErrorMessage = "Name required")]
        [StringLength(50, ErrorMessage = "Limit 50 characters.")]
        public string MatrattNamn { get; set; }
        [StringLength(200, ErrorMessage = "Limit 200 characters.")]
        public string Beskrivning { get; set; }
        [Required(ErrorMessage = "Price required")]
        public int Pris { get; set; }
        public int MatrattTypId { get; set; }

        public virtual MatrattTyp MatrattTyp { get; set; }
        public virtual ICollection<BestallningMatratt> BestallningMatratts { get; set; }
        public virtual ICollection<MatrattProdukt> MatrattProdukts { get; set; }
    }
}
