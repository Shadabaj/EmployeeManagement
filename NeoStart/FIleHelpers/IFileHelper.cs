namespace NeoStart.FIleHelpers
{
    public interface IFileHelper
    {
        void Delete(string url);

        string UploadFile(IFormFile File);
    }
}
