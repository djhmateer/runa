using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace run
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : HttpApplication
    {
        public void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute("PrettyDetails", "{id}",
                            new {controller = "Activity", action = "Details"},
                            new {id = @"\d+"} // one or more digits
                );

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new {controller = "Activity", action = "Index", id = ""} // Parameter defaults
                );
        }

        protected void Application_Start()
        {
            RegisterRoutes(RouteTable.Routes);
        }
    }
}