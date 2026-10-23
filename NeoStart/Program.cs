
using NeoStart.FIleHelpers;
using Repository;

var builder = WebApplication.CreateBuilder(args);




builder.Services.AddControllersWithViews();

//builder.Services.AddDbContext<AppDbContext>(options =>
//{
//    options.UseSqlServer(builder.Configuration.GetConnectionString("DbConnection"));
//});

ConfigureServices.RegisterService(builder.Services, builder.Configuration);

builder.Services.AddScoped<IFileHelper, FileHelper>();
builder.Services.AddTransient<NumberToWordsService>();


var app = builder.Build();

app.UseStatusCodePagesWithReExecute("/ErrorNotfound/{0}");
app.UseExceptionHandler("/Home/Error");

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.

    //app.UseStatusCodePagesWithReExecute("/ErrorNotfound/{0}");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Employee}/{action=Index}/{id?}");

app.Run();
