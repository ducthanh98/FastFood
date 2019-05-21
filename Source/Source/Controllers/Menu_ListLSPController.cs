using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Source.Areas.Admin.Controllers;
using DTO;
    

namespace Source.Controllers
{
    public class Menu_ListLSPController : BaseController
    {
        // GET: Menu_ListLSP
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult MenuPartial()
        {
            List<LoaiSanPhamDTO> lstLSP = LoaiSanPham_Service.GetAll();
            return PartialView(lstLSP);
        }
    }
}