using DAO;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Source.Areas.Admin.Controllers
{
    public class KhuyenMaiController : BaseController
    {
        // GET: Admin/KhuyenMai
        public ActionResult DanhSach()
        {
            TempData.Clear();
            return View();
        }
        public PartialViewResult _DanhSach(int pageNumber = 1, int pageSize = 10, string keyText = "")
        {
            List<KhuyenMaiDAO> list = new List<KhuyenMaiDAO>();
            try
            {
                int totalEntries;
                list = KhuyenMai_Service.GetAllBy(pageNumber, pageSize, keyText, out totalEntries);
                ViewBag.maxNumber = Math.Ceiling(totalEntries / (double)pageSize);
                ViewBag.pageNumber = pageNumber;
                ViewBag.pageSize = pageSize;
                TempData["promotions"] = list;
                TempData.Keep();
            }
            catch (Exception e)
            {
                throw e;
            }
            return PartialView(list);
        }
        public PartialViewResult _KhuyenMai_ChiTiet(int ID)
        {
            List<KhuyenMaiDAO> promotions = (List<KhuyenMaiDAO>)TempData["promotions"];
            TempData.Keep();
            KhuyenMaiDAO promotion = promotions.Where(x => x.MaKhuyenMai.Equals(ID)).FirstOrDefault();
            if (promotion == null)
            {
                promotion = new KhuyenMaiDAO();
                promotion.ThoiGianBatDau = DateTime.Now;
                promotion.ThoiGianKetThuc = DateTime.Now;
            }
            return PartialView(promotion);
        }

    }
}