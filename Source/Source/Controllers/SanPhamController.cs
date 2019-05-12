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
        public PartialViewResult _SanPham()
        {
            return PartialView();
        }

        public PartialViewResult _SanPham_ChiTiet(int pageNumber = 1, int pageSize = 5, string keyText = "")
        {
            int totalEntries;
            List<SanPhamDTO> lst = SanPham_Service.GetAllBy(pageNumber, pageSize, keyText, out totalEntries);
            ViewBag.maxNumber = Math.Ceiling(totalEntries / (double)pageSize);
            ViewBag.pageNumber = pageNumber;
            ViewBag.pageSize = pageSize;
            return PartialView(lst);
        }

    }
}