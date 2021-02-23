using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;
using TomasosPizzeria.IdentityData;
using TomasosPizzeria.Models;
using TomasosPizzeria.ViewModels;
using Microsoft.AspNetCore.Authorization;

namespace TomasosPizzeria.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        private SignInManager<ApplicationUser> _signinmanager;
        private UserManager<ApplicationUser> _usermanager;
        private TomasosContext _context;
        public AdminController(SignInManager<ApplicationUser> signinmanager,
                                UserManager<ApplicationUser> usermanager,
                                TomasosContext context)
        {
            _usermanager = usermanager;
            _signinmanager = signinmanager;
            _context = context;
        }
        public IActionResult AdminMain()
        {
            return View();
        }
        public IActionResult ManageRoles()
        {
            ManageRolesViewModel model = new();

            model.Users = _context.AspNetUsers.ToList();
            model.UserRoles = _context.AspNetUserRoles.ToList();
            model.Roles = _context.AspNetRoles.ToList();

            return View(model);
        }
        public async Task<IActionResult> ChangeRole(string id)
        {
            var user = _usermanager.Users.SingleOrDefault(x => x.Id == id);
            var userRole = _usermanager.GetRolesAsync(user).Result[0];

            if (userRole == "PremiumUser")
            {
                var remove = await _usermanager.RemoveFromRoleAsync(user, "PremiumUser");
                var add = await _usermanager.AddToRoleAsync(user, "RegularUser");
            }
            else if (userRole == "RegularUser")
            {
                var remove = await _usermanager.RemoveFromRoleAsync(user, "RegularUser");
                var add = await _usermanager.AddToRoleAsync(user, "PremiumUser");
            }

            return RedirectToAction("ManageRoles", "Admin");
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
                TempData["save"] = "Unsuccessful save";
            }
            

            return RedirectToAction("EditUser", "Admin");
        }
        public IActionResult EditOrders()
        {
            var model = new MainCoursesViewModel();

            model.Orders = _context.Bestallnings.OrderByDescending(b => b.BestallningDatum).ToList();

            return View(model);
        }
        public IActionResult ChangeOrderStatus(int id)
        {
            var orderToChange = _context.Bestallnings.SingleOrDefault(o => o.BestallningId == id);

            if (orderToChange.Levererad)
            {
                orderToChange.Levererad = false;
            }
            else
            {
                orderToChange.Levererad = true;
            }

            _context.Update(orderToChange);
            _context.SaveChanges();

            return RedirectToAction("EditOrders", "Admin");
        }
        public IActionResult DeleteOrder(int id)
        {
            var orderToDelete = _context.Bestallnings.SingleOrDefault(o => o.BestallningId == id);

            _context.Remove(orderToDelete);

            var orderCourses = _context.BestallningMatratts.Where(bm => bm.BestallningId == id).ToList();

            foreach (var ordercourse in orderCourses)
            {
                _context.Remove(ordercourse);
            }

            _context.SaveChanges();

            return RedirectToAction("EditOrders", "Admin");
        }
        public IActionResult EditCourses()
        {
            MainCoursesViewModel model = GetDataEditCourses();

            return View(model);
        }
        public IActionResult EditCourse(int id)
        {
            var currentCourse = _context.Matratts.SingleOrDefault(m => m.MatrattId == id);

            MainCoursesViewModel model = GetDataEditCourse(currentCourse.MatrattId);

            model.CurrentCourse = currentCourse;

            return PartialView("_EditCoursePartial", model);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult EditCourse(MainCoursesViewModel model)
        {
            if (ModelState.IsValid)
            {
                var existingCourseNames = _context.Matratts.Where(m => m.MatrattNamn == model.CurrentCourse.MatrattNamn
                                                                    && m.MatrattId != model.CurrentCourse.MatrattId)
                                                                    .Select(x => x.MatrattNamn).ToList();

                if (existingCourseNames.Contains(model.CurrentCourse.MatrattNamn))
                {
                    TempData["error"] = "Course already exist";
                }
                else
                {
                    var editCourse = _context.Matratts.SingleOrDefault(m => m.MatrattId == model.CurrentCourse.MatrattId);

                    _context.Entry(editCourse).CurrentValues.SetValues(model.CurrentCourse);

                    var productIds = _context.MatrattProdukts.Where(m => m.MatrattId == editCourse.MatrattId).Select(p => p.ProduktId);

                    foreach (var product in model.Ingredients)
                    {
                        if (!productIds.Contains(product.ProduktId) && product.IsChecked)
                        {
                            var newCourseIngredient = new MatrattProdukt();
                            newCourseIngredient.MatrattId = editCourse.MatrattId;
                            newCourseIngredient.ProduktId = product.ProduktId;
                            _context.Add(newCourseIngredient);
                        }
                        else if (productIds.Contains(product.ProduktId) && product.IsChecked == false)
                        {
                            var courseIngredientToRemove = new MatrattProdukt();
                            courseIngredientToRemove.MatrattId = editCourse.MatrattId;
                            courseIngredientToRemove.ProduktId = product.ProduktId;
                            _context.Remove(courseIngredientToRemove);
                        }
                    }
                    _context.SaveChanges();
                    TempData["save"] = "Save successful";
                }                
            }
            else
            {
                TempData["save"] = "Modelstate not valid";
            }

            return RedirectToAction("EditCourses", "Admin");
        }
        public IActionResult RemoveCourse(int id)
        {
            var currentOrders = _context.MatrattProdukts.Where(mp => mp.MatrattId == id).ToList();

            if (currentOrders.Count == 0)
            {
                var currentCourse = _context.Matratts.SingleOrDefault(m => m.MatrattId == id);

                foreach (var courseingredient in _context.MatrattProdukts)
                {
                    if (courseingredient.MatrattId == id)
                    {
                        _context.Remove(courseingredient);
                    }
                }

                _context.Remove(currentCourse);
                _context.SaveChanges();
            }
            else
            {
                TempData["error"] = "Unable to delete course";
            }
            

            return RedirectToAction("EditCourses", "Admin");
        }
        public IActionResult AddCourse()
        {
            MainCoursesViewModel model = GetDataAddCourses();

            return View(model);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult AddNewCourse(MainCoursesViewModel model)
        {
            if (ModelState.IsValid)
            {
                var listOfCourseNames = _context.Matratts.Select(m => m.MatrattNamn).ToList();

                if (listOfCourseNames.Contains(model.CurrentCourse.MatrattNamn))
                {
                    TempData["error"] = "Course already exist";
                }
                else
                {
                    Matratt newCourse = new();
                    newCourse.MatrattNamn = model.CurrentCourse.MatrattNamn;
                    newCourse.Beskrivning = model.CurrentCourse.Beskrivning;
                    newCourse.Pris = model.CurrentCourse.Pris;
                    newCourse.MatrattTypId = model.CurrentCourse.MatrattTyp.MatrattTypId;

                    _context.Add(newCourse);
                    _context.SaveChanges();

                    var currentCourseId = _context.Matratts.SingleOrDefault(m => m.MatrattNamn == model.CurrentCourse.MatrattNamn).MatrattId;

                    foreach (var product in model.Ingredients)
                    {
                        if (product.IsChecked)
                        {
                            var newCourseIngredient = new MatrattProdukt();
                            newCourseIngredient.MatrattId = currentCourseId;
                            newCourseIngredient.ProduktId = product.ProduktId;
                            _context.Add(newCourseIngredient);
                        }
                    }
                    _context.SaveChanges();
                    TempData["save"] = "Save successful";
                }
            }
            else
            {
                TempData["save"] = "Modelstate not valid";
            }

            return RedirectToAction("AddCourse", "Admin");
        }
        public IActionResult EditIngredients()
        {
            MainCoursesViewModel model = GetDataEditCourses();

            return View(model);
        }
        public IActionResult EditIngredient(int id)
        {
            var currentProduct = _context.Produkts.SingleOrDefault(p => p.ProduktId == id);

            MainCoursesViewModel model = GetDataEditCourses();

            model.CurrentProduct = currentProduct;

            return PartialView("_EditIngredientPartial", model);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult EditIngredient(MainCoursesViewModel model)
        {
            if (ModelState.IsValid)
            {
                var existingIngredientNames = _context.Produkts.Where(p => p.ProduktNamn == model.CurrentProduct.ProduktNamn
                                                                        && p.ProduktId != model.CurrentProduct.ProduktId)
                                                                        .Select(x => x.ProduktNamn).ToList();
                
                if (existingIngredientNames.Contains(model.CurrentProduct.ProduktNamn))
                {
                    TempData["error"] = "Ingredient already exist";
                }
                else
                {
                    var editProduct = _context.Produkts.SingleOrDefault(p => p.ProduktId == model.CurrentProduct.ProduktId);

                    _context.Entry(editProduct).CurrentValues.SetValues(model.CurrentProduct);
                    _context.SaveChanges();
                    TempData["save"] = "Save successful";
                }
            }
            else
            {
                TempData["save"] = "Modelstate not valid";
            }

            return RedirectToAction("EditIngredients", "Admin");
        }
        public IActionResult RemoveIngredient(int id)
        {
            var courseProducts = _context.MatrattProdukts.Where(mp => mp.ProduktId == id).ToList();

            if (courseProducts.Count == 0)
            {
                var removeIngredient = _context.Produkts.SingleOrDefault(p => p.ProduktId == id);

                _context.Remove(removeIngredient);
                _context.SaveChanges();
            }
            else
            {
                TempData["error"] = "Unable to delete ingredient";
            }

            return RedirectToAction("EditIngredients", "Admin");
        }
        public IActionResult AddIngredient()
        {
            MainCoursesViewModel model = GetDataEditCourses();

            return View(model);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult AddNewIngredient(MainCoursesViewModel model)
        {
            if (ModelState.IsValid)
            {
                var listOfIngredientNames = _context.Produkts.Select(p => p.ProduktNamn).ToList();

                if (listOfIngredientNames.Contains(model.CurrentProduct.ProduktNamn))
                {
                    TempData["error"] = "Ingredient already exist";
                }
                else
                {
                    Produkt newProduct = new();
                    newProduct.ProduktNamn = model.CurrentProduct.ProduktNamn;
                    _context.Add(newProduct);
                    _context.SaveChanges();

                    TempData["save"] = "Save successful";
                }
            }
            else
            {
                TempData["save"] = "Modelstate not valid";
            }

            return RedirectToAction("AddIngredient", "Admin");
        }
        public MainCoursesViewModel GetDataEditCourse(int courseid)
        {
            var model = new MainCoursesViewModel();                        
            
            model.Courses = _context.Matratts.ToList();            
            model.CourseTypes = _context.MatrattTyps.ToList();            
            model.CourseIngredients = _context.MatrattProdukts.ToList();            
            model.Ingredients = _context.Produkts.ToList();

            foreach (var ingredient in model.Ingredients)
            {
                foreach (var CourseIngredient in model.CourseIngredients)
                {
                    if (ingredient.ProduktId == CourseIngredient.ProduktId && CourseIngredient.MatrattId == courseid)
                    {
                        ingredient.IsChecked = true;
                    }
                }
            }

            return model;
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
        public MainCoursesViewModel GetDataAddCourses()
        {
            var model = new MainCoursesViewModel();

            foreach (var coursetype in _context.MatrattTyps)
            {
                model.SelectListCourseTypes.Add(new SelectListItem(coursetype.Beskrivning, coursetype.MatrattTypId.ToString()));
            }
            model.Courses = _context.Matratts.ToList();
            model.CourseTypes = _context.MatrattTyps.ToList();
            model.CourseIngredients = _context.MatrattProdukts.ToList();
            model.Ingredients = _context.Produkts.ToList();

            return model;
        }
    }
}
