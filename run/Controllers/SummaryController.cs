using System;
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

        //
        // GET: /Summary/

        public ActionResult Index()
        {
            var summaries = _repository.GetSummaries();
            return View(summaries);
        }
    }

    public class Summary
    {
        public DateTime Date;
        public double TotalK;
        public double Hours;
    }
}