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

        public ActionResult Category(long id)
        {
            var category = new CategoryDao().ViewDetail(id);
            ViewBag.Category = category;
            var model = new ProductDao().ListByCategoryId(id);
            return View(model);
        }
    }
}