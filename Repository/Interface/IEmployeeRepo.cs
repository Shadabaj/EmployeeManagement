
using Models;

namespace Repository.Interface
{
    public interface IEmployeeRepo
    {
        public bool DeleteItem(int id);

        IQueryable<EmployeeDetailsViewModel> EmployeesRecords();
        EmployeeDetailsViewModel EmployeeDetails(int id);
        bool PanNumber(string pan);

        bool Passport(string Passport);

        bool EmailAddress(string email);

        bool MobileNumber(string Mobile);
    }
}
