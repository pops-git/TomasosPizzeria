using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using TomasosPizzeria.IdentityData;
using TomasosPizzeria.Models;
using TomasosPizzeria.ViewModels;

namespace TomasosPizzeria.Controllers
{
    public class AccountController : Controller
    {
        private SignInManager<ApplicationUser> _signinmanager;
        private UserManager<ApplicationUser> _usermanager;
        private TomasosContext _context;

        public AccountController(SignInManager<ApplicationUser> signinmanager,
                                UserManager<ApplicationUser> usermanager,
                                TomasosContext context)
        {
            //Injectar Identity klasserna
            _usermanager = usermanager;
            _signinmanager = signinmanager;
            _context = context;
        }

        public IActionResult Register()
        {
            return View("Main");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Register(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                var customer = model.User;
                ApplicationUser newAccount = new ApplicationUser()
                {
                    UserName = customer.Username,
                    Email = customer.Email,
                    Gatuadress = customer.Gatuadress,
                    Namn = customer.Namn,
                    Postnr = customer.Postnr,
                    Postort = customer.Postort,
                    PhoneNumber = customer.Phone
                };

                var result = await _usermanager.CreateAsync(newAccount, customer.Password);

                await _usermanager.AddToRoleAsync(newAccount, "RegularUser");

                if (result.Succeeded)
                {
                    await _signinmanager.SignInAsync(newAccount, isPersistent: false);

                    var user = await _usermanager.FindByNameAsync(customer.Username);
                    var roles = await _usermanager.GetRolesAsync(user);

                    if (roles.Contains("RegularUser") || roles.Contains("PremiumUser"))
                    {
                        return RedirectToAction("UserMain", "User");
                    }
                    else if (roles.Contains("Admin"))
                    {
                        return RedirectToAction("AdminMain", "Admin");
                    }
                }
                else
                {
                    ViewBag.Error = "Felaktiga uppgifter försök igen";
                }
            }
            
            return View("Main");
        }
        public IActionResult Login()
        {
            return View("Main");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                var customer = model.LoginUser;

                var result = await _signinmanager.PasswordSignInAsync(customer.Username, customer.Password, false, false);
                
                if (result.Succeeded)
                {
                    var user = await _usermanager.FindByNameAsync(customer.Username);
                    var roles = await _usermanager.GetRolesAsync(user);

                    if (roles.Contains("RegularUser") || roles.Contains("PremiumUser"))
                    {
                        return RedirectToAction("UserMain", "User");
                    }
                    else if (roles.Contains("Admin"))
                    {
                        return RedirectToAction("AdminMain", "Admin");
                    }
                    return View("Main", customer);
                }
                else
                {
                    TempData["error"] = "Unable to login, check credentials";
                    return View("Main");
                }
            }

            return View("Main");
        }
        public async Task<IActionResult> Logout()
        {
            await _signinmanager.SignOutAsync();

            HttpContext.Session.Remove("order");

            return RedirectToAction("Main", "Account");
        }
        public IActionResult Main()
        {
            return View();
        }
    }
}
