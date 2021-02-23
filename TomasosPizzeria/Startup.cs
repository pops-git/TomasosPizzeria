using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TomasosPizzeria.Models;
using TomasosPizzeria.IdentityData;
using Microsoft.AspNetCore.Identity;

namespace TomasosPizzeria
{
    public class Startup
    {
        private readonly IConfiguration _configuration;
        public Startup(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc(option => option.EnableEndpointRouting = false);
            services.AddDistributedMemoryCache();
            services.AddSession();

            var conn = _configuration.GetConnectionString("Default");
            services.AddDbContext<TomasosContext>(options => options.UseSqlServer(conn));

            services.AddDbContext<ApplicationDbContext>(options => options.UseSqlServer(conn));

            services.AddIdentity<ApplicationUser, IdentityRole>()
                     .AddEntityFrameworkStores<ApplicationDbContext>()
                     .AddDefaultTokenProviders();
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseSession();
            app.UseStaticFiles();
            app.UseAuthentication();
            app.UseAuthorization();
            app.UseMvc(routes =>
            {
                routes.MapRoute(
                name: "Default",
                template: "{controller=Account}/{action=Main}"
                );
            });
        }
    }
}
