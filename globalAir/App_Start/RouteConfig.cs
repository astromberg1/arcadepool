using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ArcadePool
    {



    public class RouteConfig
        {
        public static void RegisterRoutes(RouteCollection routes)
            {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            // This informs MVC Routing Engine to send any requests for .aspx page to the WebForms engine
            routes.IgnoreRoute("{resource}.aspx/{*pathInfo}");
            routes.IgnoreRoute("{resource}.aspx");

            // Important change here: removed 'controller = "Home"' from defaults. This is the key for loading
            // root default page. With default setting removed '/' is NOT matched, so default.aspx will load instead
    //        routes.MapRoute(
    //    name: "Default",
    //    url: "{controller}/{action}/{id}",
    //    defaults: new { action = "Index", id = UrlParameter.Optional }
    //);

            routes.MapRoute(
               name: "Default",
               url: "{controller}/{action}/{id}",
               defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
           );

            }
        }
    }
     
