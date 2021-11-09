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
        public ActionResult Index(int page=1,int pageSize=3)
        {
            var blogDao = new BlogDao();
            ViewBag.NewContents = blogDao.ListNewContent(5);

            int totalRecord = 0;
            var model = new BlogDao().ListAllContent(ref totalRecord, page, pageSize);
            ViewBag.Total = totalRecord;
            ViewBag.Page = page;

            int maxPage = 5;
            int totalPage = 0;

            totalPage = (int)Math.Ceiling(totalRecord / (float)pageSize);
            ViewBag.TotalPage = totalPage;


            ViewBag.MaxPage = maxPage;

            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(model);

        }

        [ChildActionOnly]
        public ActionResult Menu()
        {
            var model = new MenuDao().ListAll();
            return PartialView(model);
        }

    }
}