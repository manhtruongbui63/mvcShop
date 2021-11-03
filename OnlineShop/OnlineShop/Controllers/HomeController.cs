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
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            var productDao = new ProductDao();
            ViewBag.NewProducts = productDao.ListNewProduct(6);
            return View();
        }

        [ChildActionOnly]
        public ActionResult Menu()
        {
            var model = new MenuDao().ListAll();
            return PartialView(model);
        }

        [ChildActionOnly]
        public ActionResult Category()
        {
            var model = new CategoryDao().ListAll();
            return PartialView(model);
        }

        [ChildActionOnly]
        public ActionResult HeaderCart()
        {
            var cart = Session[CommonConstants.CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            var model = new MenuDao().ListAll();
            return PartialView(model);
        }
    }
}