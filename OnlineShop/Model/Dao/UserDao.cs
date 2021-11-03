using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using Common;

namespace Model.Dao
{

    public class UserDao
    {
        OnlineShopDbContext db = null;
        public UserDao()
        {
            db = new OnlineShopDbContext();
        }

        public long Insert(User entity)
        {
            db.Users.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }

        public User GetById(string userName)
        {
            return db.Users.SingleOrDefault(x => x.UserName == userName);
        }

        public int LoginAdmin(string userName,string passWord)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName == userName && x.Password== passWord);
            if(result == null)
            {
                return 0;
            }
            else
            {
                if(result.GroupID == CommonConstants.ADMIN_GROUP)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
        }

        public bool Login(string userName,string passWord)
        {
            int result = db.Users.Count(x => x.UserName == userName && x.Password == passWord);
            if (result > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool CheckUserName(string username)
        {
            return db.Users.Count(x => x.UserName == username) > 0;
        }
        public bool CheckEmail(string email)
        {
            return db.Users.Count(x => x.Email == email) > 0;
        }

    }
}
