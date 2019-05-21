using DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Source.Areas.Admin.Controllers
{
    public class ChiNhanhController : BaseController
    {
        // GET: Admin/ChiNhanh
        public ActionResult DanhSach()
        {
            return View();
        }
        public PartialViewResult _DanhSach(int pageNumber = 1, int pageSize = 10, string keyText = "")
        {
            List<ChiNhanhDAO> list = new List<ChiNhanhDAO>();
            try
            {
                int totalEntries;
                list = ChiNhanh_Service.GetAllBy(pageNumber, pageSize, keyText,out totalEntries);
                ViewBag.maxNumber = Math.Ceiling(totalEntries / (double)pageSize);
                ViewBag.pageNumber = pageNumber;
                ViewBag.pageSize = pageSize;
                TempData["BOXES"] = list;
                TempData.Keep();

            } catch(Exception e)
            {
                throw e;
            }
            return PartialView(list);
        }
        public ActionResult ChiTiet_ChiNhanh(string ID)
        {
            return View();
        }
        public ActionResult ChiTiet(string ID)
        {
            return View();
        }
    }
}