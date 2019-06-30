using DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Source.Areas.Admin.Controllers
{
    public class DonHangController : BaseController
    {
        // GET: Admin/DonHang
        public ActionResult DanhSach()
        {
            return View();
        }
        public PartialViewResult _DanhSach(int pageNumber = 1, int pageSize = 10, string keyText = "")
        {
            List<DonHangDAO> list = new List<DonHangDAO>();
            try
            {
                int totalEntries;
                list = DonHang_Service.GetAllBy(pageNumber, pageSize, keyText, out totalEntries);
                ViewBag.maxNumber = Math.Ceiling(totalEntries / (double)pageSize);
                ViewBag.pageNumber = pageNumber;
                ViewBag.pageSize = pageSize;
            }
            catch (Exception e)
            {
                throw e;
            }
            return PartialView(list);
        }
    }
}