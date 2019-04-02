using BusinessLogic;
using Source.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Source.Areas.Admin.Controllers
{
    //[AuthorizeBusinessLogic]
    public class BaseController : Controller
    {
        protected LoaiChiPhiBL LoaiChiPhi_Service = new LoaiChiPhiBL();
        protected ChiNhanhBL ChiNhanh_Service = new ChiNhanhBL();
        protected TaiKhoanBL TaiKhoan_Service = new TaiKhoanBL();
    }
}