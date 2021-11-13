using Model.EF;
using Model.ViewModel;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class OrderDao
    {
        OnlineShopDbContext db = null;
        public OrderDao()
        {
            db = new OnlineShopDbContext();
        }

        public long Insert(Order order)
        {
            db.Orders.Add(order);
            db.SaveChanges();
            return order.ID;
        }

        public List<Order> ListOrder(long id)
        {
            return db.Orders.Where(x => x.CustomerID == id).ToList();
        }

        public IEnumerable<Order> ListAllPaging(int page, int pageSize)
        {
            return db.Orders.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }

        public List<OrderListByUserId> GetProductByUserId(long id)
        {
            var user = db.Users.Find(id);

            var model = (from o in db.Orders
                         join od in db.OrderDetails on o.ID equals od.OrderID
                         join p in db.Products on od.ProductID equals p.ID
                         select new OrderListByUserId()
                         {
                             ID = p.ID,
                             NameProduct = p.Name,
                             Image = p.Image,
                             OrderID = od.OrderID,
                             ProductID = od.ProductID,
                             Quantity = od.Quantity,
                             Price=od.Price,
                             orderID = o.ID,
                             CustomerID = o.CustomerID,
                             CreatedDate = o.CreatedDate
                         }
                         );
            return model.Where(x => x.CustomerID == id).ToList();
        }

        public bool Delete(int id)
        {
            try
            {
                var c = db.Orders.Find(id);
                db.Orders.Remove(c);
                db.SaveChanges();

                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }
    }
}
