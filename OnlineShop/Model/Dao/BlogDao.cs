using Common;
using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{

    public class BlogDao
    {
        OnlineShopDbContext db = null;
        public BlogDao()
        {
            db = new OnlineShopDbContext();
        }
        public long Insert(Content content)
        {
            content.MetaTitle = StringHelper.ToUnsignString(content.Name);
            db.Contents.Add(content);
            db.SaveChanges();
            return content.ID;
        }

        public List<Content> ListNewContent(int top)
        {
            return db.Contents.OrderByDescending(x => x.CreatedDate).Take(top).ToList();
        }

        public List<Content> ListAllContent(ref int totalRecord, int page = 1, int pageSize = 10)
        {
            totalRecord = db.Contents.Count();
            var model = db.Contents.OrderByDescending(x => x.CreatedDate).Skip((page - 1) * pageSize).Take(pageSize).ToList();
            return model;
        }
        public IEnumerable<Content> ListAllPaging(int page, int pageSize)
        {
            return db.Contents.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }
        public List<Content> ListAll()
        {
            return db.Contents.Where(x => x.Status == true).ToList();
        }
        public Content ViewDetail(long id)
        {
            return db.Contents.Find(id);
        }

        public Content ViewDetail(int id)
        {
            return db.Contents.Find(id);
        }

        public bool Update(Content entity)
        {
            try
            {
                var b = db.Contents.Find(entity.ID);
                b.Name = entity.Name;
                b.Description = entity.Description;
                b.Image = entity.Image;
                b.MetaTitle = StringHelper.ToUnsignString(entity.Name);
                b.Status = entity.Status;
                b.Detail = entity.Detail;
                b.ModifiedBy = entity.ModifiedBy;
                b.CreatedDate = DateTime.Now;
                b.ModifiedDate = DateTime.Now;
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
                var c = db.Contents.Find(id);
                db.Contents.Remove(c);
                db.SaveChanges();

                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

        public List<Content> ListReplatedBlog(int id)
        {
            var content = db.Contents.Find(id);
            return db.Contents.Where(x => x.ID != id && x.CategoryID == content.CategoryID).ToList();
        }

    }
}
