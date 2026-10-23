
using DAL;
using DAL.Entities;
using Models;
using Repository.Interface;

namespace Repository.Implementation
{
    public class EmployeeRepo : IEmployeeRepo
    {
        private readonly AppDbContext _db;

       

        public EmployeeRepo(AppDbContext db)
        {
            _db = db;
        }

        public bool DeleteItem(int id)
        {
            try
            {
                var data = _db.EmployeeMasters.Find(id);
                if (data != null)
                {
                    _db.EmployeeMasters.Remove(data);
                    _db.SaveChanges();
                    return true;
                }             
            }
            catch(Exception ex)
            {
                return false;
            }
            return false;
        }

        public bool EmailAddress(string email)
        {
            EmployeeMaster Email = _db.EmployeeMasters.Where(e => e.EmailAddress == email).FirstOrDefault();
            if (Email != null)
                return true;
            return false;
        }

        public EmployeeDetailsViewModel EmployeeDetails(int id)
        {
            try
            {
                var result = (from emp in _db.EmployeeMasters
                              where emp.RowId == id
                              select new EmployeeDetailsViewModel
                              {
                                  RowId = emp.RowId,
                                  EmployeeCode = emp.EmployeeCode,
                                  FirstName = emp.FirstName,
                                  LastName = emp.LastName,
                                  EmailAddress = emp.EmailAddress,
                                  MobileNumber = emp.MobileNumber,
                                  PanNumber = emp.PanNumber,
                                  PassportNumber = emp.PassportNumber,
                                  Gender = emp.Gender == 1 ? "Male" : "Female",
                                  CountryName = emp.Country.CountryName,
                                  StateName = emp.State.StateName,
                                  CityName = emp.City.CityName,
                                  DateOfJoinee = emp.DateOfJoinee,
                                  DateOfBirth =emp.DateOfBirth,
                                  ProfileImage = emp.ProfileImage,
                                  IsActive = emp.IsActive,
                                  CreatedDate = (DateTime)emp.CreatedDate
                              }).FirstOrDefault();
                if (result == null)
                {
                    return null; // Or handle this differently based on your need
                }

                return result;

            }
            catch (Exception ex)
            {

            }
            return null;
        }

        public IQueryable<EmployeeDetailsViewModel> EmployeesRecords()
        {
            try
            {
                var result = (from emp in _db.EmployeeMasters
                              select new EmployeeDetailsViewModel
                              {
                                  RowId = emp.RowId,
                                  EmployeeCode = emp.EmployeeCode,
                                  FirstName = emp.FirstName,
                                  LastName = emp.LastName,
                                  EmailAddress = emp.EmailAddress,
                                  MobileNumber = emp.MobileNumber,
                                  PanNumber = emp.PanNumber,
                                  PassportNumber = emp.PassportNumber,
                                  Gender = emp.Gender == 1 ? "Male" : "Female",
                                  CountryName = emp.Country.CountryName,
                                  StateName = emp.State.StateName,
                                  CityName = emp.City.CityName,
                                  DateOfJoinee = emp.DateOfJoinee,
                                  DateOfBirth = emp.DateOfBirth,
                                  ProfileImage = emp.ProfileImage,
                                  IsActive = emp.IsActive,
                                  CreatedDate = (DateTime)emp.CreatedDate
                              }).AsQueryable();

                if (result == null)
                {
                    return null; 
                }

                return result;

            }
            catch (Exception ex)
            {

                return null;
            }
           
        }

        public bool MobileNumber(string Mobile)
        {
            EmployeeMaster mobile = _db.EmployeeMasters.Where(e => e.MobileNumber == Mobile).FirstOrDefault();
            if (mobile!= null)
                return true;
            return false;
        }

        public bool PanNumber(string pan)
        {
            EmployeeMaster PanNum = _db.EmployeeMasters.Where(e=>e.PanNumber==pan).FirstOrDefault();
            if (PanNum != null)
                return true;
            return false;
        }

        public bool Passport(string Passport)
        {
            EmployeeMaster passport = _db.EmployeeMasters.Where(e=>e.PassportNumber==Passport).FirstOrDefault();
            if (passport != null)
                return true;
            return false;
        }

    }
}
