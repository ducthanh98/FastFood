using DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Source.Configuration
{
    public class AuthorizeBusinessLogic:ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            string path = "Source.Areas.Admin.Controllers";
            ControllerDescriptor controller = filterContext.ActionDescriptor.ControllerDescriptor;
            if (controller.ControllerType.FullName.Contains(path))
            {
                TaiKhoanDAO user = HttpContext.Current.Session["User"] == null ? null : (TaiKhoanDAO)HttpContext.Current.Session["User"];
                if (user == null)
                {
                    string url = "/Auth/Login?url=/Admin/"+controller.ControllerName + "/" + filterContext.ActionDescriptor.ActionName;
                    filterContext.Result = new RedirectResult(url);
                } else if(user.QuyenHan == 3)
                {
                    filterContext.Result = new RedirectResult("/Auth/Unauthorized");
                } /*else if(user.QuyenHan == 2)
                {
                    
                    if (controller.ControllerName != "DonHang")
                    {
                        filterContext.Result = new RedirectResult("/Auth/Unauthorized");
                    }
                }*/
            }
        }
    }
}