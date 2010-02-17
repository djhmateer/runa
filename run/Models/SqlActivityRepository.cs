using System.Collections.Generic;
using System.Linq;

namespace run.Models
{
    public class SqlActivityRepository
    {
        DB db = new DB();

        public IQueryable<Activity> GetActivities()
        {
            return db.Activities;
        }

        public IQueryable<Activity> GetActivitiesByPerson(int personId)
        {
            var activites = from a in db.Activities
                            where a.personid == personId
                            select a;
            return activites;
        }

        // return a list of all summaries - used by my simple code
        public IQueryable<weekly_summary> GetSummaries()
        {
            var summaries = from s in db.weekly_summaries
                            select s;
            return summaries;
        }

        public IQueryable<WeekSummary> GetWeeklySummary()
        {
            var weekSummaries = from p in db.Persons
                                orderby p.personname
                                let data = GetWeeklySummaryData(p.personid)
                                select new WeekSummary {Personid = p.personid, 
                                                                    Personname = p.personname, 
                                                                    Persondata = new List<WeekSummaryData>(data)};
            return weekSummaries;
        }

        IQueryable<WeekSummaryData> GetWeeklySummaryData(int personid)
        {
            var summary = from w in db.weekly_summaries
                          where w.personid == personid
                          orderby w.Year , w.Week
                          select new WeekSummaryData {Hours = w.hours, 
                                                                    Kilometers = w.kilometres, 
                                                                    Week = w.Week, 
                                                                    Year = w.Year};
            return summary;
        }

        public Activity GetActivity(int id)
        {
            //var activity = (from a in dc.Activities
            //                where a.activityid == id
            //                select a).SingleOrDefault();
            return db.Activities.SingleOrDefault(a => a.activityid == id);
        }

        public IQueryable<Person> GetPeople()
        {
            return db.Persons;
        }

        public void Add(Activity activity)
        {
            db.Activities.InsertOnSubmit(activity);
        }

        public void Save()
        {
            db.SubmitChanges();
        }

        public void Update(Activity activity)
        {
            db.SubmitChanges();
        }

        public void Delete(Activity activity)
        {
            db.Activities.DeleteOnSubmit(activity);
            db.SubmitChanges();
        }
    }

    public class WeekSummary
    {
        public int Personid;
        public string Personname;
        public List<WeekSummaryData> Persondata;
    }

    public class WeekSummaryData
    {
        public double? Hours;
        public double? Kilometers;
        public int? Week;
        public int? Year;
    }
}