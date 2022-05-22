using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace MBlog
{
    /// <summary>
    /// VerificationCode生成验证码
    /// </summary>
    public class Verify : IHttpHandler, IRequiresSessionState
    {
        private Random RandomSeed = new Random();
        public void ProcessRequest(HttpContext context)
        {
            //供验证码使用的字符
            string strWord = "23456789QWERTYUPASDFGHKXCVBNM";
            string NumStr = null;
            for (int i = 0; i < 5; i++)
            {
                NumStr += strWord[RandomSeed.Next(0, strWord.Length)];
            }
            //将验证码保存到session中
            context.Session["vcode"] = NumStr.ToLower();
            CreateImages(context, NumStr);
        }


        #region 生成验证码图片
        private void CreateImages(HttpContext context, string checkCode)
        {
            int iwidth = (int)(checkCode.Length * 13);
            System.Drawing.Bitmap image = new System.Drawing.Bitmap(iwidth, 22);
            Graphics g = Graphics.FromImage(image);
            g.Clear(Color.White);
            //定义颜色
            Color[] c = { Color.Black, Color.Red, Color.DarkBlue, Color.Green, Color.Orange, Color.Brown, Color.DarkCyan, Color.Purple };
            //定义字体
            string[] font = { "Verdana", "Microsoft Sans Serif", "Comic Sans MS", "Arial", "宋体" };
            Random rand = new Random();
            //随机输出噪点
            for (int i = 0; i < 50; i++)
            {
                int x = rand.Next(image.Width);
                int y = rand.Next(image.Height);
                g.DrawRectangle(new Pen(Color.LightGray, 0), x, y, 1, 1);
            }
            //输出不同字体和颜色的验证码字符
            for (int i = 0; i < checkCode.Length; i++)
            {
                int cindex = rand.Next(7);
                int findex = rand.Next(5);

                Font f = new System.Drawing.Font(font[findex], 10, System.Drawing.FontStyle.Bold);
                Brush b = new System.Drawing.SolidBrush(c[cindex]);
                int ii = 4;
                if ((i + 1) % 2 == 0)
                {
                    ii = 2;
                }
                g.DrawString(checkCode.Substring(i, 1), f, b, 2 + (i * 12), ii);
            }
            //画一个边框
            g.DrawRectangle(new Pen(ColorTranslator.FromHtml("#CCCCCC"), 0), 0, 0, image.Width - 1, image.Height - 1);
            //输出到浏览器
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            image.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            context.Response.ClearContent();
            //Response.ClearContent();
            context.Response.ContentType = "image/gif";
            context.Response.BinaryWrite(ms.ToArray());
            g.Dispose();
            image.Dispose();

        }
        #endregion
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
