using Model.Dao;
using OnlineShop.Common;
using OnlineShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Controllers
{
    public class BlogController : Controller
    {
        // GET: Blog
        public ActionResult Index()
        {

            var blogDao = new BlogDao();
            ViewBag.NewContents = blogDao.ListNewContent(6);
            return View();

        }

        [ChildActionOnly]
        public ActionResult Menu()
        {
            var model = new MenuDao().ListAll();
            return PartialView(model);
        }

    }
}