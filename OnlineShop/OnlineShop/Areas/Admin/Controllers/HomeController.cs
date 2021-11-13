using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class HomeController : BaseController
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            var orderDetail = new OrderDetailDao();
            //Revenue By Day
            ViewBag.Day = orderDetail.ListOrderByDay().Select(x => x.Date.Value.ToString("dd MMM yyyy")).ToList();
            ViewBag.RevenueByDay = orderDetail.ListOrderByDay().Select(x => x.Revenue).ToList();

            //Revenue By Month
            ViewBag.Month = orderDetail.ListOrderByMonth().Select(x => x.Date.Value.ToString("MMM yyyy")).ToList();
            ViewBag.RevenueByMonth = orderDetail.ListOrderByMonth().Select(x => x.Revenue).ToList();

            //Revenue By Customer
            ViewBag.Customer = orderDetail.ListOrderByCustomer().Select(x => x.Name.Trim()).ToList();
            ViewBag.RevenueByCustomer = orderDetail.ListOrderByCustomer().Select(x => x.Revenue).ToList();
            
            return View();
        }

    }
}