using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TomasosPizzeria.Models;

namespace TomasosPizzeria.ViewModels
{
    public class MainCoursesViewModel
    {
        public Matratt CurrentCourse { get; set; }
        public Produkt CurrentProduct { get; set; }
        public double TotalSum { get; set; }
        public double SumWithDiscount { get; set; }
        public double Discount { get; set; }
        public List<SelectListItem> SelectListCourseTypes { get; set; }
        public List<Matratt> Courses { get; set; }
        public List<Matratt> OrderCourses { get; set; }
        public List<MatrattProdukt> CourseIngredients { get; set; }
        public List<MatrattTyp> CourseTypes { get; set; }
        public List<Produkt> Ingredients { get; set; }
        public List<Bestallning> Orders { get; set; }

        public MainCoursesViewModel()
        {
            Courses = new();
            SelectListCourseTypes = new();
            OrderCourses = new();
            CourseIngredients = new();
            CourseTypes = new();
            Ingredients = new();
            Orders = new();
            TotalSum = 0;
            SumWithDiscount = 0;
        }
    }
}
