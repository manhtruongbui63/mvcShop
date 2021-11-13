using Model.Dao;
using Model.EF;
using OnlineShop.Common;
using OnlineShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Logout()
        {
            Session[CommonConstants.USER_SESSION] = null;
            return Redirect("/");
        }

        [HttpPost]
        public ActionResult Register(RegisterModels model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                if (dao.CheckUserName(model.UserName))
                {
                    ModelState.AddModelError("", "Username is existed");
                }
                else if (dao.CheckEmail(model.Email))
                {
                    ModelState.AddModelError("", "Email is existed");
                }
                else
                {
                    var user = new User();

                    user.UserName = model.UserName;
                    //user.Password = model.Password;
                    user.Password = Encryptor.MD5Hash(model.Password);
                    user.Name = model.Name;
                    user.Email = model.Email;
                    user.Address = model.Address;
                    user.Phone = model.Phone;
                    user.CreatedDate = DateTime.Now;
                    //user.GroupID = "MEMBER";
                    user.Status = true;

                    var result= dao.Insert(user);
                    if (result > 0)
                    {
                        ViewBag.Success = "Register successfull !";
                        model = new RegisterModels();
                    }
                    else
                    {
                        ModelState.AddModelError("", "Register failse !");
                    }
                }
            }
            return View(model);

        }

        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                var result = dao.Login(model.UserName, Encryptor.MD5Hash(model.Password));
                if (result)
                {
                    var user = dao.GetById(model.UserName);
                    var userSession = new UserLogin();

                    userSession.UserName = user.UserName;
                    userSession.UserID = user.ID;

                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return Redirect("/");
                }
                else
                {
                    ModelState.AddModelError("", "Login failse !");
                }
            }
            return View(model);
        }

    }
}