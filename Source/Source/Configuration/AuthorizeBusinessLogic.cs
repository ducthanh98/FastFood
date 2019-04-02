using DTO;
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
                TaiKhoanDTO user = HttpContext.Current.Session["User"] == null ? null : (TaiKhoanDTO)HttpContext.Current.Session["User"];
                if (user == null)
                {
                    filterContext.Result = new RedirectResult("/Auth/Login");
                } else if(user.QuyenHan == 3)
                {
                    filterContext.Result = new RedirectResult("/Auth/Unauthorized");
                } else if(user.QuyenHan == 2)
                {
                    
                    if (controller.ControllerName != "DonHang")
                    {
                        filterContext.Result = new RedirectResult("/Auth/Unauthorized");
                    }
                }
            }
        }
    }
}