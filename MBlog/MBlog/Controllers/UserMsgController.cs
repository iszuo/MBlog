using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MBlog.Models;
namespace MBlog.Controllers
{
    public class UserMsgController : Controller
    {
        // GET: UserMsg
        public ActionResult Index()
        {

            using (MicroBlogEntities db = new MicroBlogEntities())
            {
                var id = (Session["user"] as User).Id;
                var user = db.User.FirstOrDefault(u => u.Id == id);
                ViewBag.user = user;
                var gz = db.Follow_Fans.Where(u => u.Follow == id).Count();
                ViewBag.gz = gz;
                var wbc = db.Msg.Where(w => w.Userid == id).Count();
                ViewBag.wbc = wbc;
                var fs = db.Follow_Fans.Where(u => u.Fans == id).Count();
                ViewBag.fs = fs;
                var wbxx = db.Msg.Where(w => w.Userid == id).ToList();
                return View(wbxx);
            }

        }

        public ActionResult Deletewb(int mid)
        {
            using (MicroBlogEntities db = new MicroBlogEntities())
            {

                Msg ms = db.Msg.FirstOrDefault(o => o.Id == mid);
                db.Msg.Remove(ms);
                if (db.SaveChanges() > 0)
                {
                    return Content("true");
                }
                else
                {
                    return Content("false");
                }


            }

        }
        public ActionResult fensi()
        {
            using (MicroBlogEntities db = new MicroBlogEntities())
            {
                var id = (Session["user"] as User).Id;
                var fs = db.Follow_Fans.Where(u => u.Fans == id).Count();
                ViewBag.fs = fs;

                return View(db.Follow_Fans.Include("User").Where(f => f.Fans == id).ToList());
            }


        }
        [HttpPost]
        public ActionResult fensi(string uname)
        {
            using (MicroBlogEntities db = new MicroBlogEntities())
            {
                var id = (Session["user"] as User).Id;

                return View(db.Follow_Fans.Include("User").Where(f => f.Fans == id).Where(u => u.User.Nick.Contains(uname)).ToList());
            }


        }
        public ActionResult guanzhu()
        {
            using (MicroBlogEntities db = new MicroBlogEntities())
            {
                var id = (Session["user"] as User).Id;
                var gz = db.Follow_Fans.Where(u => u.Follow == id).Count();
                ViewBag.gz = gz;
                return View(db.Follow_Fans.Include("User1").Where(f => f.Follow == id).ToList());
            }
        }
        [HttpPost]
        public ActionResult guanzhu(string uname)
        {
            using (MicroBlogEntities db = new MicroBlogEntities())
            {
                var id = (Session["user"] as User).Id;

                return View(db.Follow_Fans.Include("User1").Where(f => f.Follow == id).Where(u => u.User1.Nick.Contains(uname)).ToList());
            }
        }
        public ActionResult Cancel(int uid)
        {
            using (MicroBlogEntities db = new MicroBlogEntities())
            {
                var id = (Session["user"] as User).Id;
                Follow_Fans f = db.Follow_Fans.FirstOrDefault(o => o.Fans == uid && o.Follow == id);
                db.Follow_Fans.Remove(f);
                if (db.SaveChanges() > 0)
                {
                    return Content("true");
                }
                else
                {
                    return Content("false");
                }
            }
        }
        public ActionResult Delfs(int uid)
        {
            using (MicroBlogEntities db = new MicroBlogEntities())
            {
                var id = (Session["user"] as User).Id;
                Follow_Fans f = db.Follow_Fans.FirstOrDefault(o => o.Follow == uid && o.Fans == id);
                db.Follow_Fans.Remove(f);
                if (db.SaveChanges() > 0)
                {
                    return Content("true");
                }
                else
                {
                    return Content("false");
                }
            }
        }
    }
}