 using Model.EF;
using Model.ViewModel;
using PagedList;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class OrderDetailDao
    {
        OnlineShopDbContext db = null;
        public OrderDetailDao()
        {
            db = new OnlineShopDbContext();
        }

        public bool Insert(OrderDetail detail)
        {
            try
            {
                db.OrderDetails.Add(detail);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public List<OrderListViewModel> ListOrderByCustomer()
        {
            var model = (from o in db.Orders
                         join od in db.OrderDetails on o.ID equals od.OrderID
                         join u in db.Users on o.CustomerID equals u.ID
                         group new { o, od, u } by new { u.ID, u.Name } into gr
                         select new OrderListViewModel()
                         {
                             Name = gr.FirstOrDefault().u.Name.ToString(),
                             Revenue = gr.Where(x => x.o.CustomerID == x.u.ID).Select(x => x.od.Price * x.od.Quantity).Sum()
                         });
            return model.OrderBy(x => x.Name).ToList();
        }

        public List<OrderListViewModel> ListOrderByDay()
        {
            var model = (from o in db.Orders
                         join od in db.OrderDetails
                         on o.ID equals od.OrderID
                         group new { o, od } by new { o.CreatedDate } into gr
                         select new OrderListViewModel()
                         {
                             Date = gr.FirstOrDefault().o.CreatedDate,
                             Revenue = gr.Select(x => x.od.Price * x.od.Quantity).Sum()
                         });
            return model.OrderBy(x => x.Date).ToList();
        }

        public List<OrderListViewModel> ListOrderByMonth()
        {
            var model = (from o in db.Orders
                         join od in db.OrderDetails
                         on o.ID equals od.OrderID
                         group new { o, od } by new { o.CreatedDate.Value.Month } into gr
                         select new OrderListViewModel()
                         {
                             Date = gr.FirstOrDefault().o.CreatedDate,
                             Revenue = gr.Select(x => x.od.Price * x.od.Quantity).Sum()
                         });
            return model.OrderBy(x => x.Date).ToList();
        }
    }
}
