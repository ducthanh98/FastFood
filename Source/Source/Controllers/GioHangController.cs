using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DTO;
using Source.Areas.Admin.Controllers;

namespace Source.Controllers
{
    public class GioHangController : BaseController
    {
        // GET: GioHang
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult SanPham_ChiTiet(int MaMatHang, bool laSanPham)
        {
            if (laSanPham == false)
            {
                Combo_SanPham sp_cb = Combo_Service.SelectByPrimaryKey(MaMatHang);
                TempData["mh"] = sp_cb;
            }
            else
            {
                SanPhamDTO sp = SanPham_Service.GetByID(MaMatHang);
                TempData["mh"] = sp;
            }
            return PartialView();
        }

    }
}
