using System.Diagnostics;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using NeoStart.Models;
using UI.Models;

namespace NeoStart.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private readonly NumberToWordsService _numberToWordsService;

        public HomeController(ILogger<HomeController> logger, NumberToWordsService numberToWordsService)
        {
            _logger = logger;
            _numberToWordsService = numberToWordsService;
        }

        public IActionResult Index()
        {

            return View();
        }

        [HttpPost]
        public IActionResult ConvertNumberToWords(int number)
        {
            var result = _numberToWordsService.ConvertToWords(number);
            ViewBag.Result = result;
            return View("Index");
        }

        public IActionResult Calculate(Practice model)
        {
            ViewBag.Answer = model.Numb1 + model.Numb2;
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            var ExceptionError = HttpContext.Features.Get<IExceptionHandlerFeature>();
            ViewBag.ExceptionPath = ExceptionError.Path;
            ViewBag.ExceptionMessage = ExceptionError.Error.Message;
            ViewBag.stactrace = ExceptionError.Error.StackTrace;
            return View();
        }


        [Route("ErrorNotfound/{StatusCode}")]
        public IActionResult Errors(int StatusCode)
        {
            var ErrorResult = HttpContext.Features.Get<IStatusCodeReExecuteFeature>();

            switch(StatusCode)
            {
                case 404:
                    ViewBag.errorMessage = "Sorry the Resource Could Not Be Found";
                    ViewBag.Path = ErrorResult.OriginalPath;
                    ViewBag.QS = ErrorResult.OriginalQueryString;
                    break;
            }
            return View();
        }
    }
}
