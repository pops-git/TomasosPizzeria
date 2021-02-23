using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using TomasosPizzeria.IdentityData;
using TomasosPizzeria.Models;
using TomasosPizzeria.ViewModels;

namespace TomasosPizzeria.Controllers
{
    [Authorize(Roles = "RegularUser,PremiumUser")]
    public class UserController : Controller
    {
        private UserManager<ApplicationUser> _usermanager;
        private TomasosContext _context;
        public UserController(UserManager<ApplicationUser> usermanager,
                                TomasosContext context)
        {
            _usermanager = usermanager;
            _context = context;
        }
        public IActionResult UserMain()
        {
            HttpContext.Session.SetString("products", 0.ToString());
            return View();
        }
        public IActionResult MainCourses()
        {
            MainCoursesViewModel model = GetDataEditCourses();

            return View(model);
        }
        public IActionResult BuyCourse(int id)
        {
            List<Matratt> order;
            string jsonOrder;

            if (HttpContext.Session.GetString("order") == null)
            {
                order = new();
            }
            else
            {
                jsonOrder = HttpContext.Session.GetString("order");

                order = JsonConvert.DeserializeObject<List<Matratt>>(jsonOrder);
            }

            var course = _context.Matratts.SingleOrDefault(c => c.MatrattId == id);
            order.Add(course);

            HttpContext.Session.SetString("products", order.Count().ToString());

            jsonOrder = JsonConvert.SerializeObject(order);

            HttpContext.Session.SetString("order", jsonOrder);


            return RedirectToAction("MainCourses", "User");
        }
        public IActionResult RemoveCourse(int id)
        {
            MainCoursesViewModel model = new();

            string jsonOrder = HttpContext.Session.GetString("order");

            model.Courses = JsonConvert.DeserializeObject<List<Matratt>>(jsonOrder);

            var courseToRemove = model.Courses.Where(c => c.MatrattId == id).First();

            model.Courses.Remove(courseToRemove);

            HttpContext.Session.SetString("products", model.Courses.Count().ToString());

            jsonOrder = JsonConvert.SerializeObject(model.Courses);

            HttpContext.Session.SetString("order", jsonOrder);

            return RedirectToAction("Checkout", "User");
        }
        public IActionResult Checkout()
        {
            MainCoursesViewModel model = new();

            if (HttpContext.Session.GetString("order") != null)
            {
                string jsonOrder = HttpContext.Session.GetString("order");

                model.Courses = JsonConvert.DeserializeObject<List<Matratt>>(jsonOrder);

                var currentUser = _context.AspNetUsers.SingleOrDefault(u => u.Id == _usermanager.GetUserId(HttpContext.User));

                if (User.IsInRole("PremiumUser") && model.Courses.Count > 0)
                {
                    if (currentUser.Points >= 100)
                    {
                        model.Discount = model.Courses.OrderBy(c => c.Pris).First().Pris;
                        model.Courses.OrderBy(c => c.Pris).First().Pris = 0;
                        model.SumWithDiscount = model.Courses.Sum(c => c.Pris);
                    }
                    if (model.Courses.Count >= 3)
                    {
                        model.SumWithDiscount = model.Courses.Sum(c => c.Pris) * 0.8;
                        model.Discount += (model.Courses.Sum(c => c.Pris) - model.SumWithDiscount);
                    }
                    else
                    {
                        model.SumWithDiscount = model.Courses.Sum(c => c.Pris);
                    }
                }
                else
                {
                    model.TotalSum = model.Courses.Sum(c => c.Pris);
                }
            }

            return View(model);
        }
        public IActionResult ConfirmCheckout(MainCoursesViewModel model)
        {
            Bestallning newOrder = new();
            newOrder.BestallningDatum = DateTime.Now;
            if (User.IsInRole("PremiumUser"))
            {
                newOrder.Totalbelopp = (int)model.SumWithDiscount;
            }
            else if (User.IsInRole("RegularUser"))
            {
                newOrder.Totalbelopp = (int)model.TotalSum;
            }
            newOrder.Levererad = false;
            newOrder.Id = _usermanager.GetUserId(HttpContext.User);

            _context.Add(newOrder);
            _context.SaveChanges();

            var currentOrderId = _context.Bestallnings.SingleOrDefault(b => b.BestallningDatum == newOrder.BestallningDatum
                                                                        && b.Id == newOrder.Id).BestallningId;

            string jsonOrder = HttpContext.Session.GetString("order");
            var courses = JsonConvert.DeserializeObject<List<Matratt>>(jsonOrder);

            var orderedCourses = courses.OrderBy(x => x.MatrattId).ToList();
            var qty = 0;
            for (int i = 0; i < orderedCourses.Count; i++)
            {
                qty++;
                if (i < orderedCourses.Count - 1)
                {
                    if (orderedCourses[i + 1].MatrattId != orderedCourses[i].MatrattId)
                    {
                        BestallningMatratt bm = new BestallningMatratt();
                        bm.MatrattId = orderedCourses[i].MatrattId;
                        bm.BestallningId = currentOrderId;
                        bm.Antal = qty;
                        _context.Add(bm);
                        qty = 0;
                    }
                }
                else if (i == orderedCourses.Count - 1)
                {
                    BestallningMatratt bm = new BestallningMatratt();
                    bm.MatrattId = orderedCourses[i].MatrattId;
                    bm.BestallningId = currentOrderId;
                    bm.Antal = qty;
                    _context.Add(bm);
                    qty = 0;
                }                
            }

            if (User.IsInRole("PremiumUser"))
            {
                var pointsToAdd = courses.Count * 10;

                var userToUpdate = _context.AspNetUsers.SingleOrDefault(u => u.Id == _usermanager.GetUserId(HttpContext.User));

                if (userToUpdate.Points >= 100 && courses.Count > 0)
                {
                    userToUpdate.Points -= 100;
                }
                
                userToUpdate.Points += pointsToAdd;

                _context.Update(userToUpdate);
            }
            

            _context.SaveChanges();

            HttpContext.Session.Remove("order");
            HttpContext.Session.SetString("products", 0.ToString());

            return RedirectToAction("Checkout", "User");
        }
        public IActionResult EditUser()
        {
            UpdateUserViewModel model = new();

            var currentUser = _context.AspNetUsers.SingleOrDefault(u => u.Id == _usermanager.GetUserId(HttpContext.User));

            model.Email = currentUser.Email;
            model.Gatuadress = currentUser.Gatuadress;
            model.Namn = currentUser.Namn;
            model.Postnr = currentUser.Postnr;
            model.Postort = currentUser.Postort;
            model.Phone = currentUser.PhoneNumber;

            return View(model);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult UpdateUser(UpdateUserViewModel model)
        {
            if (ModelState.IsValid)
            {
                var userToUpdate = _context.AspNetUsers.SingleOrDefault(u => u.Id == _usermanager.GetUserId(HttpContext.User));

                userToUpdate.Email = model.Email;
                userToUpdate.Gatuadress = model.Gatuadress;
                userToUpdate.Namn = model.Namn;
                userToUpdate.Postnr = model.Postnr;
                userToUpdate.Postort = model.Postort;
                userToUpdate.PhoneNumber = model.Phone;

                _context.Update(userToUpdate);
                _context.SaveChanges();

                TempData["save"] = "Save successful";
            }
            else
            {
                TempData["save"] = "Modelstate not valid";
            }


            return RedirectToAction("EditUser", "User");
        }
        public MainCoursesViewModel GetDataEditCourses()
        {
            var model = new MainCoursesViewModel();

            model.Courses = _context.Matratts.ToList();
            model.CourseTypes = _context.MatrattTyps.ToList();
            model.CourseIngredients = _context.MatrattProdukts.ToList();
            model.Ingredients = _context.Produkts.ToList();

            return model;
        }
    }
}
