using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAO;
using Source.Areas.Admin.Controllers;

namespace Source.Controllers
{
    public class SanPhamController : BaseController
    {
        // GET: MenuProduct
        public ActionResult LoaiSanPham()
        {
            List<LoaiSanPhamDAO> lstLSP = LoaiSanPham_Service.GetAll();
            return View(lstLSP);
        }
        public ActionResult SanPham()
        {
            return View();
        }
        public PartialViewResult _SanPham(int MaLoaiSanPham)
        {
            List<SanPham_LoaiSanPham> lstSP = SanPham_Service.SP_GetAllBy(MaLoaiSanPham);
            List<Combo_SanPham> lstCB = Combo_Service.CB_GetAllBy(MaLoaiSanPham);
            TempData["sanPham"] = lstSP;
            TempData["comBo"] = lstCB;
            return PartialView();
        }

        public PartialViewResult SanPham_ChiTiet(int MaMatHang, bool laSanPham)
        {
            //List<DAO.SanPhamDAO> lstsp = SanPham_Service.GetAll().Where(x => x.MaLoaiSanPham == 5).ToList();
            //ViewBag.lstNuoc = lstsp;
            if (laSanPham == false)
            {
                Combo_SanPham sp_cb = Combo_Service.SelectByPrimaryKey(MaMatHang);
                ViewBag.cbdetail = sp_cb;
            }
            else
            {
                SanPhamDAO sp = SanPham_Service.GetByID(MaMatHang);
                ViewBag.spdetail = sp;
            }
            return PartialView();
       }
        public PartialViewResult _KhuyenMai()
        {
            List<KhuyenMaiDAO> lstKM = KhuyenMai_Service.GetAll();
            return PartialView(lstKM);
        }
    }
}