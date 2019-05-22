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
        public ActionResult Index()
        {
            return View();
        }

    }
}
