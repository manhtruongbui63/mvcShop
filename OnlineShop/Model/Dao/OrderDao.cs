using Model.EF;
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
