using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net.Mail;
using System.Net;
using MBlog.Models;

namespace MBlog.Controllers
{
    public class LogInRegisterController : Controller
    {
        // 数据库实体
        MicroBlogEntities db = new MicroBlogEntities();
        // 初始化验证码
        static string cood = createrandom(6).ToLower();
        string cood2 = cood;
        //生成6位数字和验证码
        private static string createrandom(int codelengh)
        {
            int rep = 0;
            string str = string.Empty;
            long num2 = DateTime.Now.Ticks + rep;
            rep++;
            Random random = new Random(((int)(((ulong)num2) & 0xffffffffL)) | ((int)(num2 >> rep)));
            for (int i = 0; i < codelengh; i++)
            {
                char ch;
                int num = random.Next();
                if ((num % 2) == 0)
                {
                    ch = (char)(0x30 + ((ushort)(num % 10)));
                }
                else
                {
                    ch = (char)(0x41 + ((ushort)(num % 0x1a)));
                }
                str = str + ch.ToString();
            }
            return str;
        }
       
        // 页面
        public ActionResult LogInRegister()
        {
            return View();
        }


        /// <summary>
        /// 登录
        /// </summary>
        [HttpPost]
        public ActionResult Login(string email_l, string pwd_l, string code_l)
        {
            if (email_l == "")
            {
                return Content("请输入登录账号");
            }
            if (pwd_l == "")
            {
                return Content("请输入登录密码");
            }
            else if (pwd_l.Length > 6  && pwd_l.Length < 18 )
            {
                return Content("密码长度需要在6-18位");
            }
            if (code_l == "")
            {
                return Content("请输入验证码");
            }
            if (code_l != Session["vcode"].ToString())
            {
                return Content("验证码有误，请重新输入！");
            }
            var user = db.User.FirstOrDefault(u => u.Email == email_l && u.Password == pwd_l);
            // 将用户信息保存到session
            Session["user"] = user;
            return Content("true");
        }

        /// <summary>
        /// 注册
        /// </summary>
        [HttpPost]
        public ActionResult Register(string email_r, string pwd_r, string code_r)
        {
            if (email_r == "")
            {
                return Content("邮箱不能为空");
            }
            if (pwd_r == "")
            {
                return Content("密码不能为空");
            }
            if (code_r == "")
            {
                return Content("验证码不能为空");
            }
            if (code_r != cood2)
            {
                return Content("验证码不正确");
            }
            User u = new User();
            if (u != null)
            {
                u.Email = email_r;
                u.Password = pwd_r;
                db.User.Add(u);
                db.SaveChanges();
                return Content("true");
            }
            return Content("该用户不存在，请重新输入。");
        }

        /// <summary>
        /// 发送验证码
        /// </summary>
        [HttpPost]
        public ActionResult Code(string email_r)
        {
            if (email_r.Contains("@"))
            {
                //实例化一个发送邮件类。
                MailMessage mailMessage = new MailMessage();
                //发件人邮箱地址，方法重载不同，可以根据需求自行选择。
                mailMessage.From = new MailAddress("1073520602@qq.com");
                //收件人邮箱地址。
                mailMessage.To.Add(new MailAddress(email_r));
                //邮件标题。
                mailMessage.Subject = "这是你的验证码为：";
                //邮件内容。
                mailMessage.Body = "验证码：" + cood + "。此验证码只用于登录微博验证身份，请勿转发他人。【微博】";
                //实例化一个SmtpClient类。
                SmtpClient client = new SmtpClient();
                //在这里我使用的是qq邮箱，所以是smtp.qq.com，如果你使用的是126邮箱，那么就是smtp.126.com。
                client.Host = "smtp.qq.com";
                //使用安全加密连接。
                client.EnableSsl = true;
                //不和请求一块发送。
                client.UseDefaultCredentials = false;
                //验证发件人身份(发件人的邮箱，邮箱里的生成授权码);
                client.Credentials = new NetworkCredential("1073520602@qq.com", "meumiycwxrhwbdie");
                //发送
                client.Send(mailMessage);
                return Content("发送成功");
            }
            return Content("邮箱格式有误，请重新输入。");
        }
   
        
        public ActionResult SignOut()
        {
            if (Session["user"] != null)
            {
                Session.Clear();
                return RedirectToAction("Index", "Home");
            }
            return View();
            
        }




    }
}