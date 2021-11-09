using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class ProductDao
    {
        OnlineShopDbContext db = null;
        public ProductDao()
        {
            db = new OnlineShopDbContext();
        }
        public long Insert(Product product)
        {
            db.Products.Add(product);
            db.SaveChanges();
            return product.ID;
        }

        public bool Update(Product entity)
        {
            try
            {
                var p = db.Products.Find(entity.ID);

                p.Name = entity.Name;
                p.Description = entity.Description;
                p.MetaTitle = entity.MetaTitle;
                p.CategoryID = entity.CategoryID;
                p.Image = entity.Image;
                p.Quantity = entity.Quantity;
                p.Price = entity.Price;
                p.Detail = entity.Detail;
                p.Status = entity.Status;
                p.ModifiedBy = entity.ModifiedBy;
                p.ModifiedDate = DateTime.Now;

                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public Product GetById(string name)
        {
            return db.Products.SingleOrDefault(x => x.Name == name);
        }

        public Product ViewDetail(long id)
        {
            return db.Products.Find(id);
        }

        public bool Delete(int id)
        {
            try
            {
                var p = db.Products.Find(id);
                db.Products.Remove(p);
                db.SaveChanges();

                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

        public IEnumerable<Product> ListAllPaging(int page, int pageSize)
        {
            return db.Products.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }

        public List<Product> ListNewProduct(int top)
        {
            return db.Products.OrderByDescending(x => x.CreatedDate).Take(top).ToList();
        }

        public List<Product> ListReplatedProduct(int id)
        {
            var product = db.Products.Find(id);
            return db.Products.Where(x => x.ID != id && x.CategoryID == product.CategoryID).ToList();
        }

        public List<Product> ListByCategoryId(int categoryID,ref int totalRecord,int page=1,int pageSize=10)
        {
            totalRecord = db.Products.Where(x => x.CategoryID == categoryID).Count();
            var model = db.Products.Where(x => x.CategoryID == categoryID).OrderByDescending(x=>x.CreatedDate).Skip((page-1)*pageSize).Take(pageSize).ToList();
            return model;
        }
    }
}
