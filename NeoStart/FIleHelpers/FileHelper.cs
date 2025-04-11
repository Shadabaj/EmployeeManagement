namespace NeoStart.FIleHelpers
{
    public class FileHelper : IFileHelper
    {
        IWebHostEnvironment _env;

        public FileHelper(IWebHostEnvironment env)
        {
            _env = env;
        }

        public void Delete(string url)
        {
            if (File.Exists(_env.WebRootPath + url))
            {
                File.Delete(_env.WebRootPath + url);
            }
        }

        public string UploadFile(IFormFile file)
        {
            var allowedExtensions = new[] { ".jpg", ".jpeg", ".png" };

            var fileExtension = Path.GetExtension(file.FileName).ToLower();

            if (!allowedExtensions.Contains(fileExtension))
            {
                return "Only JPG, JPEG, or PNG files are allowed."; 
            }
            const long maxSize = 200 * 1024; 
            if (file.Length > maxSize)
            {
                return "File size cannot exceed 200 KB."; 
            }
            var uploads = Path.Combine(_env.WebRootPath, "Uploads");
            bool exists = Directory.Exists(uploads);
            if (!exists)
            {
                Directory.CreateDirectory(uploads);
            }
            var filename = GeneratedFileName(file.FileName);
            var filePath = Path.Combine(uploads, filename);
            using (var fileStream = new FileStream(filePath, FileMode.Create))
            {
                file.CopyTo(fileStream);
            }
            return "/Uploads/" + filename;
        }


        private string GeneratedFileName(string fileName)
        {
            string[] strname = fileName.Split('.');
            string filename = DateTime.Now.ToUniversalTime().ToString("yyyyMMdd\\THHmmssfff") + "." + strname[strname.Length - 1];
            return filename;
        }
    }
}
