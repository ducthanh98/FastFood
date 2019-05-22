using DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace Source.Helpers
{

    public class CookieHelper
    {
        public static TaiKhoanDAO  checkCookie()
        {
            TaiKhoanDAO user = new TaiKhoanDAO();
            if(HttpContext.Current.Request.Cookies["username"]!= null)
            {
                user.TenTaiKhoan = HttpContext.Current.Request.Cookies["username"].Value;
            }
            if (HttpContext.Current.Request.Cookies["password"] != null)
            {
                user.MatKhau = HttpContext.Current.Request.Cookies["password"].Value;
            }

            return user;
        }
        public static void set(string user,string pass,bool remember)
        {
            if (remember)
            {
                HttpCookie userCookie = new HttpCookie("username", user);
                HttpContext.Current.Response.Cookies.Add(userCookie);
                HttpCookie passCookie = new HttpCookie("password", pass);
                HttpContext.Current.Response.Cookies.Add(passCookie);

            } else
            {
                HttpContext.Current.Request.Cookies.Remove("username");
                HttpContext.Current.Request.Cookies.Remove("password");
                HttpContext.Current.Response.Cookies["username"].Expires = DateTime.Now.AddDays(-1);
                HttpContext.Current.Response.Cookies["password"].Expires= DateTime.Now.AddDays(-1);

            }

        }
    }
}