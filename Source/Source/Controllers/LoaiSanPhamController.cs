using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DTO;
using Source.Areas.Admin.Controllers;

namespace Source.Controllers
{
    public class LoaiSanPhamController : BaseController
    {
        // GET: MenuProduct
        public ActionResult LoaiSanPham()
        {
            List<LoaiSanPhamDTO> list = LoaiSanPham_Service.GetAll();
            return View(list);
        }

        public ActionResult ListMenu()
        {
            List<LoaiSanPhamDTO> list = new List<LoaiSanPhamDTO>();
            return View(list);
        }
    }
}