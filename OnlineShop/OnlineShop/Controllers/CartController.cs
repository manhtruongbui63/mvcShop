﻿using Model.Dao;
using Model.EF;
using OnlineShop.Common;
using OnlineShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace OnlineShop.Controllers
{
    public class CartController : Controller
    {
        // Hằng số không thể thay đổi
        private const string CartSession = "CartSession";

        // GET: Cart
        public ActionResult Index()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }



        public ActionResult AddItem(long productId, int quantity)
        {
            // ViewDetail(productId)
            var product = new ProductDao().ViewDetail(productId);
            var cart = Session[CartSession];
            if (cart != null)
            {
                var list = (List<CartItem>)cart;
                if (list.Exists(x => x.Product.ID == productId))
                {
                    foreach (var item in list)
                    {
                        if (item.Product.ID == productId)
                        {
                            item.Quantity += quantity;
                        }

                    }
                }
                else
                {
                    // Tạo mới đối tượng cart item
                    var item = new CartItem();
                    item.Product = product;
                    item.Quantity = quantity;
                    list.Add(item);
                }

                Session[CartSession] = list;

            }
            else
            {
                // Tạo mới đối tượng cart item
                var item = new CartItem();
                item.Product = product;
                item.Quantity = quantity;
                var list = new List<CartItem>();
                list.Add(item);

                // Gắn vào session
                Session[CartSession] = list;
            }
            return RedirectToAction("Index");
        }

        public JsonResult Update(string cartModel)
        {
            var jsonCart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            var sessionCart = (List<CartItem>)Session[CartSession];

            foreach (var item in sessionCart)
            {
                var jsonItem = jsonCart.SingleOrDefault(x => x.Product.ID == item.Product.ID);
                if (jsonItem != null)
                {
                    item.Quantity = jsonItem.Quantity;
                }
            }
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }

        public JsonResult DeleteAll()
        {
            Session[CartSession] = null;
            return Json(new
            {
                status = true
            });
        }

        public JsonResult Delete(long id)
        {
            var sessionCart = (List<CartItem>)Session[CartSession];
            sessionCart.RemoveAll(x => x.Product.ID == id);
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }

        [HttpGet]
        public ActionResult Payment()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }

        [HttpPost]
        public ActionResult Payment(string shipName, string mobile, string address, string email)
        {
            if (Session[CommonConstants.USER_SESSION] != null)
            {
                var session = (UserLogin)Session[OnlineShop.Common.CommonConstants.USER_SESSION];
                string username = session.UserName;
                var user = new UserDao().GetById(username);

                // user.Address = address;
                // user.Phone = mobile;
                // user.Name = shipName;
                // user.Email = email;

                var order = new Order();
                order.CustomerID = user.ID;
                order.CreatedDate = DateTime.Now;
                order.ShipAddress = address;
                order.ShipMobile = mobile;
                order.ShipName = shipName;
                order.ShipEmail = email;

                try
                {
                    var id = new OrderDao().Insert(order);
                    var cart = (List<CartItem>)Session[CartSession];
                    var detailDao = new OrderDetailDao();
                    foreach (var item in cart)
                    {
                        var orderDetail = new OrderDetail();
                        orderDetail.ProductID = item.Product.ID;
                        orderDetail.OrderID = id;
                        orderDetail.Price = item.Product.Price;
                        orderDetail.Quantity = item.Quantity;
                        detailDao.Insert(orderDetail);
                    }
                    Session[CommonConstants.CartSession] = null;
                }
                catch
                {
                    //Ghi log
                    return Redirect("/loi-thanh-toan");
                }
                // --lam moi gio hang
                Session[CartSession] = null;
                return Redirect("/hoan-thanh");
            }
            else
            {
                return Redirect("/login");
            }

        }

        public ActionResult Success()
        {
            return View();
        }
    }
}