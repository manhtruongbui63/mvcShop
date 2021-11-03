using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Detail(int id)
        {
            var product = new ProductDao().ViewDetail(id);
            ViewBag.RelatedPRoduct = new ProductDao().ListReplatedProduct(id);
            return View(product);
        }

        public ActionResult Category(int id,int page=1,int pageSize=1)
        {
            var category = new CategoryDao().ViewDetail(id);
            ViewBag.Category = category;

            int totalRecord = 0;
            var model = new ProductDao().ListByCategoryId(id,ref totalRecord,page,pageSize);
            ViewBag.Total = totalRecord;
            ViewBag.Page = page;

            int maxPage = 5;
            int totalPage = 0;
            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;

            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(model);
        }
    }
}