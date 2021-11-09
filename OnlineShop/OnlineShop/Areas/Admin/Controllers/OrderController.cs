using Model.Dao;
using Model.EF;
using OnlineShop.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class OrderController : BaseController
    {
        // GET: Admin/Order
        [ValidateInput(false)]
        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            var dao = new OrderDao();
            var model = dao.ListAllPaging(page, pageSize);
            return View(model);
        }


        public ActionResult Delete(int id)
        {
            new OrderDao().Delete(id);
            return RedirectToAction("Index");
        }

    }
}