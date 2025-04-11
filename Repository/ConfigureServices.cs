using DAL;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Repository.Implementation;
using Repository.Interface;

namespace Repository
{
    public class ConfigureServices
    {
        public static void RegisterService(IServiceCollection services, IConfiguration configuration)
        {
      
            services.AddDbContext<AppDbContext>(options =>
            {
                options.UseSqlServer(configuration.GetConnectionString("DbConnection"));
            });

            services.AddScoped<IEmployeeRepo, EmployeeRepo>();
        }
    }
}
