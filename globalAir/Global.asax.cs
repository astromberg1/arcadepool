using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace ArcadePool
    {
    public class MvcApplication : System.Web.HttpApplication
        {
        protected void Application_Start()
            {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            //routes.IgnoreRoute("WebForms/*/{resource}.aspx/{*pathInfo}");
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            }
        }
    }
