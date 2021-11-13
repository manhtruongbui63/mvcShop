using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class OrderDetailController : BaseController
    {
        // GET: Admin/OrderDetail
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Revenue()
        {
            var orderDetail = new OrderDetailDao();
            ViewBag.ListByCustomer = orderDetail.ListOrderByCustomer();
            ViewBag.ListByDay = orderDetail.ListOrderByDay();
            ViewBag.ListByMonth = orderDetail.ListOrderByMonth();
            return View();
        }
    }
}