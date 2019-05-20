using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DTO;
using Source.Areas.Admin.Controllers;

namespace Source.Controllers
{
    public class SanPhamController : BaseController
    {
        // GET: MenuProduct
        public ActionResult LoaiSanPham()
        {
            List<LoaiSanPhamDTO> lstLSP = LoaiSanPham_Service.GetAll();
            return View(lstLSP);
        }


        public ActionResult SanPham()
        {
            return View();
        }
        public PartialViewResult _SanPham(int MaLoaiSanPham)
        {
            List<SanPham_LoaiSanPham> lstSP = SanPham_Service.SP_GetAllBy(MaLoaiSanPham);
            List<ComBo_LoaiSanPham> lstCB = Combo_Service.CB_GetAllBy(MaLoaiSanPham);
            TempData["sanPham"] = lstSP;
            TempData["comBo"] = lstCB;
            return PartialView();
        }

        public PartialViewResult _KhuyenMai()
        {
            List<KhuyenMaiDTO> lstKM = KhuyenMai_Service.GetAll();
            return PartialView(lstKM);
        }
    }
}