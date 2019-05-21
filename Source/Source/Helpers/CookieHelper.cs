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
                HttpContext.Current.Request.Cookies.Add(new HttpCookie("username", user));
                HttpContext.Current.Request.Cookies.Add(new HttpCookie("password", pass));
            } else
            {
                HttpContext.Current.Request.Cookies.Clear();
            }
            
        }
    }
}