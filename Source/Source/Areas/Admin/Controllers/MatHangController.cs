using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Source.Areas.Admin.Controllers
{
    public class MatHangController : BaseController
    {
        // GET: Admin/MatHang
        public ActionResult SanPham()
        {
            return View();
        }
        public PartialViewResult _SanPham()
        {
            return PartialView();
        }

        public PartialViewResult _SanPham_ChiTiet()
        {
            return PartialView();
        }
    }
}