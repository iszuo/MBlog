using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MBlog.Models;
using System.Data;
using System.Collections;

namespace MBlog.Controllers
{
    public class HomeController : Controller
    {
        MicroBlogEntities db = new MicroBlogEntities();

        /// <summary>
        /// 热门页
        /// </summary>
        public ActionResult Index()
        {
            ViewBag.lst = db.Msg.Include("user").ToList();
            return View();
        }
        /// <summary>
        /// 点赞
        /// </summary>
        [HttpGet]
        public ActionResult AddZan(int id)
        {
            Msg ms = db.Msg.FirstOrDefault(m => m.Id == id);
            ms.Click_num++;
            if (db.SaveChanges() > 0)
            {
                return Content(ms.Click_num.ToString());

            }
            return Content("false");
        }
        /// <summary>
        /// 回复
        /// </summary>
        /// <param name="msg_id">微博id</param>
        /// <param name="texts">回复的信息</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Reply(int msg_id,string texts)
        {
            if (Session["user"] != null)
            {
                if (texts != "")
                {
                    int userid = (Session["user"] as User).Id;
                    Make mk = new Make()
                    {
                        UserId = userid,
                        MsgId = msg_id,
                        MakeText = texts
                    };
                    db.Make.Add(mk);
                    if (db.SaveChanges() > 0)
                    {
                        return Content("true");
                    }
                    else
                    {
                        return Content("出现了一些问题，请联系网站管理员");
                    }
                }
                return Content("内容不能为空");

            }
            return Content("请登录账号后重试");
        }



        /// <summary>
        /// 视频页
        /// </summary>
        public ActionResult Video()
        {
            ViewBag.video_show = db.Msg.Include("user").ToList();
            return View();
        }

        #region 发布信息页
        public ActionResult Release_Msg()
        {
            ViewBag.show_msg = db.Msg.Include("user").Include("Make").ToList();
            return View();
        }
        #endregion


        #region 发布微博
        public ActionResult Add_Blog()
        {
            return View();
        }
        #endregion


    }
}
