using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAO;
using Source.Areas.Admin.Controllers;

namespace Source.Controllers
{
    public class GioHangController : BaseController
    {
        // GET: GioHang
        public ActionResult GioHang()
        {
            return View();
        }
         public PartialViewResult GioHang_ChiTiet( int MaMatHang, bool laSanPham, int soLuong)
        {
            List<GioHang> lstGH = new List<DAO.GioHang>();
            GioHang gh = new DAO.GioHang();
            gh.SoLuong = soLuong;
            if (laSanPham == false)
            {
                gh.MaCombo = MaMatHang;
                Combo_SanPham cb = Combo_Service.SelectByPrimaryKey(MaMatHang);
                ViewBag.cb = cb;
            }
            else
            {
                gh.MaSanPham = MaMatHang;
                SanPhamDAO sp = SanPham_Service.GetByID(MaMatHang);
                ViewBag.sp = sp;
            }
            lstGH.Add(gh);
            return PartialView(lstGH);
        }
    }
}
