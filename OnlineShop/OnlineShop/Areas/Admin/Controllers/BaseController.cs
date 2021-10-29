using OnlineShop.Common;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var sess = (UserLogin)Session[CommonConstants.USER_SESSION];
            if (sess == null)
            {
                filterContext.Result = new RedirectToRouteResult(new 
                    RouteValueDictionary(new { controller = "Admin/Login", action = "Index", Erea = "Admin" }));
            }

            base.OnActionExecuting(filterContext);
        }
        // changing culture
        public ActionResult ChangeCulture(string ddlCulture, string returnUrl)
        {
            Thread.CurrentThread.CurrentCulture = new CultureInfo(ddlCulture);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(ddlCulture);

            Session[CommonConstants.CurrentCulture] = ddlCulture;
            return Redirect(returnUrl);
        }
    }
}