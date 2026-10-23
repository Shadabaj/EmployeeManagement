
using DAL;
using DAL.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using NeoStart.FileHelpers;
using NeoStart.FIleHelpers;
using NeoStart.Models;
using Repository.Interface;


namespace NeoStart.Controllers
{
    public class EmployeeController : Controller
    {
        private readonly AppDbContext _db;
        private readonly IFileHelper _file;
        private readonly IEmployeeRepo _employeeService;
        private readonly ILogger<EmployeeController> _logger;

        public EmployeeController(AppDbContext db, IFileHelper file, IEmployeeRepo employeeService, ILogger<EmployeeController> logger)
        {
            _db = db;
            _file = file;
            _employeeService = employeeService;
            _logger = logger;
        }

        public IActionResult Index(string SearchText = "", int page = 1, int pageSize = 5, string sortCol = "EmployeeCode", string sortDir = "asc")
        {
            ViewData["sortCol"] = sortCol;
            ViewData["sortDir"] = sortDir;

            ViewBag.EmployeeCount = _db.EmployeeMasters.Count();

            var result = _employeeService.EmployeesRecords();

  
            if (page < 1)
            {
                page = 1;
            }

      
            if (!string.IsNullOrWhiteSpace(SearchText))
            {
                result = result.Where(emp => emp.FirstName.Contains(SearchText) ||
                                             emp.LastName.Contains(SearchText) ||
                                             emp.EmailAddress.Contains(SearchText));
            }
            switch (sortCol)
            {
                case "FirstName":
                    result = sortDir == "asc" ? result.OrderBy(f => f.FirstName) : result.OrderByDescending(f => f.FirstName);
                    break;
                case "LastName":
                    result = sortDir == "asc" ? result.OrderBy(f => f.LastName) : result.OrderByDescending(f => f.LastName);
                    break;
                case "Country":
                    result = sortDir == "asc" ? result.OrderBy(f => f.CountryName) : result.OrderByDescending(f => f.CountryName);
                    break;
                case "EmailAddress":
                    result = sortDir == "asc" ? result.OrderBy(f => f.EmailAddress) : result.OrderByDescending(f => f.EmailAddress);
                    break;
                case "MobileNumber":
                    result = sortDir == "asc" ? result.OrderBy(f => f.MobileNumber) : result.OrderByDescending(f => f.MobileNumber);
                    break;
                case "Gender":
                         result = sortDir == "asc" ? result.OrderBy(f => f.Gender) : result.OrderByDescending(f => f.Gender);
                    break;
                default:
                    result = sortDir == "asc" ? result.OrderBy(f => f.EmployeeCode) : result.OrderByDescending(f => f.EmployeeCode);
                    break;
            }

            int totalRecords = result.Count();


            var data = result.Skip((page - 1) * pageSize).Take(pageSize).ToList();

           
            Pager pager = new Pager(totalRecords, page, pageSize);
            ViewBag.pager = pager;

            return View(data);  
        }

        public IActionResult Create()
        {
         
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(EmployeeModel model)
        {
                ModelState.Remove("RowId");
            if (model.UploadImage != null)
            {
                var uploadResult = _file.UploadFile(model.UploadImage);

                if (uploadResult.Contains("Only") || uploadResult.Contains("size"))
                {
                    TempData["ErrorMessage"] = uploadResult; 
                    //ViewBag.Countries = new SelectList(_db.Countries, "RowId", "CountryName", model.CountryId);
                    //ViewBag.States = new SelectList(_db.States.Where(s => s.CountryId == model.CountryId), "RowId", "StateName", model.StateId);
                    //ViewBag.Cities = new SelectList(_db.Cities.Where(c => c.StateId == model.StateId), "RowId", "CityName", model.CityId);
                    return View(model);
                }
                else
                {
                    model.ProfileImage = uploadResult;
                }
            }
            else
            {
                TempData["ErrorMessage"] = "Please select a profile picture to upload";
                //ViewBag.Countries = new SelectList(_db.Countries, "RowId", "CountryName", model.CountryId);
                //ViewBag.States = new SelectList(_db.States.Where(s => s.CountryId == model.CountryId), "RowId", "StateName", model.StateId);
                //ViewBag.Cities = new SelectList(_db.Cities.Where(c => c.StateId == model.StateId), "RowId", "CityName", model.CityId);
                return View(model);
            }



            bool EmailExists = _employeeService.EmailAddress(model.EmailAddress);
            bool PanExists = _employeeService.PanNumber(model.PanNumber);
            bool PassportExists = _employeeService.Passport(model.PassportNumber);
            bool PhoneNoExists = _employeeService.MobileNumber(model.MobileNumber);

            if (EmailExists)
                ModelState.AddModelError("EmailAddress", "Already Exists Select New One");
            if (PassportExists)
                ModelState.AddModelError("PassportNumber", "Already Exists Select New One");
            if (PhoneNoExists)
                ModelState.AddModelError("MobileNumber", "Already Exists Select New One");
            if (PanExists)
                ModelState.AddModelError("PanNumber", "Already Exists Select New One");
            if (model.Gender==null)
            {
                TempData["Gender"] = "Kimdly select the Gender";
            }

            EmployeeMaster emp = new EmployeeMaster
           {
               EmployeeCode = model.EmployeeCode,
                FirstName = model.FirstName,
               LastName = model.LastName,
               EmailAddress = model.EmailAddress,
               MobileNumber = model.MobileNumber,
               PanNumber = model.PanNumber,
               PassportNumber = model.PassportNumber,
               ProfileImage = model.ProfileImage,
               DateOfBirth = model.DateOfBirth,  
               DateOfJoinee = model.DateOfJoinee,  
               Gender = (byte)model.Gender,
               IsActive = model.IsActive,
               CountryId = model.CountryId,
               StateId = model.StateId,
               CityId = model.CityId
           };
           var status = new OutputParameter<int?>();
           try
            {
                await _db.Procedures.stp_Emp_CreationsAsync(
                    emp.EmployeeCode,
                    emp.FirstName,
                    emp.LastName,
                    emp.CountryId,
                    emp.StateId,
                    emp.CityId,
                    emp.EmailAddress,
                    emp.MobileNumber,
                    emp.PanNumber,
                    emp.PassportNumber,
                    emp.ProfileImage,
                    emp.Gender,
                    emp.IsActive,
                    emp.DateOfBirth,
                  emp.DateOfJoinee,
                    status
                );
                if (status.Value > 0)
                {
                    return RedirectToAction(nameof(Index)); 
                }
                else
                {
                    ViewBag.Error = "Something went wrong. Unable to add the employee record.";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.StackTrace);
                ViewBag.Error = "An error occurred while processing the request.";
            }
            return View(model);
        }

        public IActionResult Edit(int id)
        {
            var data = _db.EmployeeMasters.Include(u => u.City)
                                          .ThenInclude(c => c.State)
                                          .ThenInclude(s => s.Country)
                                          .FirstOrDefault(u => u.RowId == id);

            if (data != null)
            {
                EditEmployee model = new EditEmployee
                {
                    RowId = data.RowId,
                    EmployeeCode = data.EmployeeCode,
                    FirstName = data.FirstName,
                    LastName = data.LastName,
                    EmailAddress = data.EmailAddress,
                    MobileNumber = data.MobileNumber,
                    PanNumber = data.PanNumber,
                    PassportNumber = data.PassportNumber,
                    ProfileImage = data.ProfileImage,
                    DateOfJoinee = data.DateOfJoinee,
                    IsActive = data.IsActive,
                    DateOfBirth = data.DateOfBirth,
                    CountryId = (int)data.CountryId,
                    StateId = (int)data.StateId,
                    CityId = (int)data.CityId,
                    Gender = (Gender)data.Gender,
                    CreatedDate =(DateTime) data.CreatedDate
                };

                ViewBag.Countries = new SelectList(_db.Countries, "RowId", "CountryName", data.CountryId);
                ViewBag.States = new SelectList(_db.States.Where(s => s.CountryId == data.CountryId), "RowId", "StateName", data.StateId);
                ViewBag.Cities = new SelectList(_db.Cities.Where(c => c.StateId == data.StateId), "RowId", "CityName", data.CityId);

                return View(model);
            }
            return NotFound();
        }


        [HttpPost]
        public IActionResult Edit(EditEmployee model)
        {
            try
            {
                var existingEmployee = _db.EmployeeMasters.FirstOrDefault(e => e.RowId == model.RowId);

                if (existingEmployee != null)
                {
                    existingEmployee.EmployeeCode = model.EmployeeCode;
                    existingEmployee.FirstName = model.FirstName;
                    existingEmployee.LastName = model.LastName;
                    existingEmployee.EmailAddress = model.EmailAddress;
                    existingEmployee.MobileNumber = model.MobileNumber;
                    existingEmployee.PanNumber = model.PanNumber;
                    existingEmployee.PassportNumber = model.PassportNumber;
                    existingEmployee.IsActive = model.IsActive;
                    existingEmployee.DateOfBirth = (DateOnly)model.DateOfBirth;
                    existingEmployee.DateOfJoinee = (DateOnly)model.DateOfJoinee;
                    existingEmployee.Gender = (byte)model.Gender;
                    existingEmployee.CountryId = model.CountryId;
                    existingEmployee.StateId = model.StateId;
                    existingEmployee.CityId = model.CityId;
                    existingEmployee.UpdatedDate = DateTime.UtcNow;

                    if (model.UploadImage != null)
                    {
                        var allowedExtensions = new[] { "image/jpeg", "image/png", "image/jpg" };
                        if (!allowedExtensions.Contains(model.UploadImage.ContentType))
                        {
                            return Json(new { success = false, message = "Only JPG, JPEG, or PNG files are allowed." });
                        }

                        // Delete old image if exists
                        _file.Delete(existingEmployee.ProfileImage);
                        existingEmployee.ProfileImage = _file.UploadFile(model.UploadImage);
                    }
                    _db.EmployeeMasters.Update(existingEmployee);
                    _db.SaveChanges();

                    return Json(new { success = true, message = "Employee updated successfully!" });
                }
                else
                {
                    return Json(new { success = false, message = "Employee not found." });
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.StackTrace);
                return Json(new { success = false, message = "An error occurred while updating the employee." });
            }
        }




        public IActionResult Delete(int id,string url)
        {
            bool isDelete = _employeeService.DeleteItem(id);
            url = url.Replace("%2F","/");
            if (isDelete)
            {
                _file.Delete(url);
                return RedirectToAction(nameof(Index));
            }
            return View();
        }
       

        public IActionResult Details(int id)
        {
           var model = _employeeService.EmployeeDetails(id);
            if (model !=null)
            {
                return View(model);
            }
            return View();
        }

        public JsonResult Country()
        {
            var countries = _db.Countries.ToList();
            return new JsonResult(countries);
 
        }
      
        public JsonResult State(int countryId)
        {
            var states = _db.States.Where(s => s.CountryId == countryId).ToList();
            return new JsonResult(states);
        }

        public JsonResult City(int stateId)
        {
            var cities = _db.Cities.Where(c=>c.StateId== stateId).ToList();
            return new JsonResult(cities);
        }



        public IActionResult GetStates(int countryId)
        {
            var states = _db.States.Where(s => s.CountryId == countryId)
                                   .Select(s => new { s.RowId, s.StateName })
                                   .ToList();
            return Json(states);
        }

        public IActionResult GetCities(int stateId)
        {
            var cities = _db.Cities.Where(c => c.StateId == stateId)
                                   .Select(c => new { c.RowId, c.CityName })
                                   .ToList();
            return Json(cities);
        }
    }

}






//[HttpPost]
//public IActionResult Edit(EditEmployee model)
//{
//    try
//    {
//        var existingEmployee = _db.EmployeeMasters.FirstOrDefault(e => e.RowId == model.RowId);

//        if (existingEmployee != null)
//        {
//            existingEmployee.EmployeeCode = model.EmployeeCode;
//            existingEmployee.FirstName = model.FirstName;
//            existingEmployee.LastName = model.LastName;
//            existingEmployee.EmailAddress = model.EmailAddress;
//            existingEmployee.MobileNumber = model.MobileNumber;
//            existingEmployee.PanNumber = model.PanNumber;
//            existingEmployee.PassportNumber = model.PassportNumber;
//            existingEmployee.IsActive = model.IsActive;
//            existingEmployee.DateOfBirth = (DateOnly)model.DateOfBirth;
//            existingEmployee.DateOfJoinee = (DateOnly)model.DateOfJoinee;
//            existingEmployee.Gender = (byte)model.Gender;
//            existingEmployee.CountryId = model.CountryId;
//            existingEmployee.StateId = model.StateId;
//            existingEmployee.CityId = model.CityId;
//            existingEmployee.UpdatedDate = DateTime.UtcNow;

//            if (model.UploadImage != null)
//            {
//                var allowedExtensions = new[] { "image/jpeg", "image/png", "image/jpg" };
//                if (!allowedExtensions.Contains(model.UploadImage.ContentType))
//                {

//                    TempData["ErrorMessage"] = "Only JPG, JPEG, or PNG files are allowed";
//                    ViewBag.Countries = new SelectList(_db.Countries, "RowId", "CountryName", model.CountryId);
//                    ViewBag.States = new SelectList(_db.States.Where(s => s.CountryId == model.CountryId), "RowId", "StateName", model.StateId);
//                    ViewBag.Cities = new SelectList(_db.Cities.Where(c => c.StateId == model.StateId), "RowId", "CityName", model.CityId);
//                    return View(model);
//                }


//                _file.Delete(existingEmployee.ProfileImage);
//                existingEmployee.ProfileImage = _file.UploadFile(model.UploadImage);
//            }

//            // Update the employee in the database
//            _db.EmployeeMasters.Update(existingEmployee);
//            _db.SaveChanges();

//            return RedirectToAction(nameof(Index));
//        }
//        else
//        {
//            return NotFound();
//        }
//    }
//    catch (Exception ex)
//    {
//        Console.WriteLine(ex.StackTrace);
//        ModelState.AddModelError("", "An error occurred while updating the employee.");
//    }

//    // Rebuild the SelectLists to retain the previous values in case of an error
//    ViewBag.Countries = new SelectList(_db.Countries, "RowId", "CountryName", model.CountryId);
//    ViewBag.States = new SelectList(_db.States.Where(s => s.CountryId == model.CountryId), "RowId", "StateName", model.StateId);
//    ViewBag.Cities = new SelectList(_db.Cities.Where(c => c.StateId == model.StateId), "RowId", "CityName", model.CityId);

//    return View(model);
//}
