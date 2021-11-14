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
    public class BlogController : BaseController
    {
        // GET: Admin/Blog
        [ValidateInput(false)]
        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            var dao = new BlogDao();
            var model = dao.ListAllPaging(page, pageSize);
            return View(model);
        }

        [HttpGet]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }

        public ActionResult Edit(int id)
        {
            var content = new BlogDao().ViewDetail(id);
            SetViewBag();
            return View(content);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Content model)
        {
            if (ModelState.IsValid)
            {
                var id = new BlogDao().Insert(model);
                if (id > 0)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("", "Add content failse");
                }
            }
            SetViewBag();
            return View(model);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Content model)
        {
            if (ModelState.IsValid)
            {
                var result = new BlogDao().Update(model);
                if (result)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("", "Update blog failse");
                }
            }
            SetViewBag();
            return View(model);
        }

        public ActionResult Delete(int id)
        {
            new BlogDao().Delete(id);
            return RedirectToAction("Index");
        }

        public void SetViewBag(int? select = null)
        {
            var dao = new CategoryDao();
            ViewBag.CategoryID = new SelectList(dao.ListAll(), "ID", "Name", select);
        }
    }
}