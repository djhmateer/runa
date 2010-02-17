using System.Web.Mvc;
using run.Models;

namespace run.Controllers
{
    public class SummaryController : Controller
    {
        SqlActivityRepository _repository;

        public SummaryController()
        {
            _repository = new SqlActivityRepository();
        }

        public ActionResult Index()
        {
            var summaries = _repository.GetWeeklySummary();
            return View(summaries);
        }
    }
}