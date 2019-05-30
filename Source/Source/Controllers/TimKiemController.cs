using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAO;
using Source.Areas.Admin.Controllers;

namespace Source.Controllers
{
    public class TimKiemController : BaseController
    {
        // GET: TimKiem
        public ActionResult KQTimKiem(string sTuKhoa)
        {
            var lstSP = SanPham_Service.SelectBy(sTuKhoa);
            return View(lstSP);
        }
    }
}