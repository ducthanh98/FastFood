using DAO;
using Source.Areas.Admin.Controllers;
using Source.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Source.Controllers
{
    public class AuthController : BaseController
    {
        // GET: Auth
        public ActionResult Login()
        {
            Session.RemoveAll();
            TaiKhoanDAO user = CookieHelper.checkCookie();
            return View(user);
        }
        public RedirectToRouteResult Logout()
        {
            Session.RemoveAll();
            return RedirectToAction("Index","Home");
        }

        [HttpPost]
        public ActionResult Login(string username, string password,string remember,string url)
        {
            TaiKhoanDAO user = new TaiKhoanDAO();
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                ViewBag.error = "Vui lòng nhập đầy đủ thông tin";
                return View(user);
            }
            CookieHelper.set(username, password, remember == "on");
             user = TaiKhoan_Service.checkExistAcc(username, password);
            if(user == null)
            {
                ViewBag.error = "Tài khoản hoặc mật khẩu không chính xác!";
                user = CookieHelper.checkCookie();
                return View(user);
            } else
            {
                Session["User"] = user;
                if (!string.IsNullOrEmpty(url))
                {
                    return Redirect(url);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        public ActionResult ForgotPassword()
        {
            return View();
        }

        public ActionResult Register()
        {
            return View();
        }
        public ActionResult NotFound()
        {
            return View();
        }
        public ActionResult Unauthorized()
        {
            return View();
        }
    }
}