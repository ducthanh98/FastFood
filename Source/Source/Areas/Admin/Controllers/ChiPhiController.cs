using BusinessLogic;
using DAO;
using Source.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Source.Areas.Admin.Controllers
{
    public class ChiPhiController : BaseController
    {
        // GET: Admin/ChiPhi
        public ActionResult DanhSachChiPhi()
        {
            return View();
        }

        public ActionResult DanhSachLoaiChiPhi()
        {
            List<LoaiChiPhiDAO> list = new List<LoaiChiPhiDAO>();
            try
            {
                int totalEntries = LoaiChiPhi_Service.GetAllEntries();
                list = LoaiChiPhi_Service.GetAllBy(1, 10, "");
            } catch(Exception e)
            {
                throw e;
            }
            return View(list);
        }
    }
}