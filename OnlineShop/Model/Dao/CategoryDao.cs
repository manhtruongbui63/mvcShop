using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class CategoryDao
    {
        OnlineShopDbContext db = null;
        public CategoryDao()
        {
            db = new OnlineShopDbContext();
        }
        public long Insert(Category category)
        {
            db.Categories.Add(category);
            db.SaveChanges();
            return category.ID;
        }
        public IEnumerable<Category> ListAllPaging(int page,int pageSize)
        {
            return db.Categories.OrderByDescending(x=>x.ID).ToPagedList(page, pageSize);
        }
        public List<Category> ListAll()
        {
            return db.Categories.Where(x => x.Status == true).ToList();
        }
        public ProductCategory ViewDetail(long id)
        {
            return db.ProductCategories.Find(id);
        }

        public Category ViewDetail(int id)
        {
            return db.Categories.Find(id);
        }

        public bool Update(Category entity)
        {
            try
            {
                var c = db.Categories.Find(entity.ID);
                c.Name = entity.Name;
                c.MetaTitle = entity.MetaTitle;
                c.Status = entity.Status;
                c.ModifiedBy = entity.ModifiedBy;
                c.ModifiedDate = DateTime.Now;
                
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Delete(int id)
        {
            try
            {
                var c = db.Categories.Find(id);
                db.Categories.Remove(c);
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
