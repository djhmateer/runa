using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using run.Models;

namespace run.Controllers
{
    public class ActivityController : Controller
    {
        SqlActivityRepository _repository;

        public ActivityController()
        {
            _repository = new SqlActivityRepository();
        }

        //
        // GET: /Activity/

        public ActionResult Index(int? personid)
        {
            List<Person> people = _repository.GetPeople().ToList();
            people.Add(new Person {personid = 0, personname = "All"});
            people.Sort(delegate(Person p1, Person p2) // sorting on the personid field so All is at the top.
            {
                return p1.personid.CompareTo(p2.personid);
            }
                );
            ViewData["People"] = new SelectList(people, "personid", "personname", 0);

            List<Activity> activities;
            if (personid == null || personid == 0) // or is all
                activities = _repository.GetActivities().ToList();
            else
                activities = _repository.GetActivitiesByPerson(personid.Value).ToList();

            return View(activities);
        }

        //
        // GET: /Activity/Details/5

        public ActionResult Details(int id)
        {
            var activity = _repository.GetActivity(id);
            if (activity == null)
                return View("NotFound");
            return View("Details", activity);
        }

        //
        // GET: /Activity/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Activity/Create

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(Activity activity)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    _repository.Add(activity);
                    _repository.Save();
                    return RedirectToAction("Index");
                }
                catch
                {
                    return View(activity);
                }
            }
            else
            {
                return View(activity);
            }
        }

        //
        // GET: /Activity/Edit/5

        public ActionResult Edit(int id)
        {
            var activity = _repository.GetActivity(id);
            return View(activity);
        }

        //
        // POST: /Activity/Edit/5

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            var activity = _repository.GetActivity(id);
            try
            {
                UpdateModel(activity, collection.ToValueProvider());
                _repository.Update(activity);
                return RedirectToAction("Index");
            }
            catch
            {
                return View(activity);
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        //       [Authorize(Roles="Administrator")]
        public ActionResult Delete(int id)
        {
            //var db = new DB();
            //var dinner = (from a in db.Dinners
            //              where a.DinnerID == id
            //              select a).SingleOrDefault();
            //db.Dinners.DeleteOnSubmit(dinner);
            //db.SubmitChanges();
            var dinner = _repository.GetActivity(id);
            _repository.Delete(dinner);

            return RedirectToAction("Index");
        }
    }
}