using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class OrderListByUserId
    {
        public long ID { get; set; }
        public string NameProduct { get; set; }
        public string Image { get; set; }
        public long OrderID { get; set; }
        public long ProductID { get; set; }
        public int? Quantity { get; set; }
        public decimal? Price { get; set; }
        public long orderID { get; set; }
        public long? CustomerID { get; set; }
        public DateTime? CreatedDate { get; set; }
    }
}
