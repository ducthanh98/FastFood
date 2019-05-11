using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DTO;
using Source.Areas.Admin.Controllers;

namespace Source.Controllers
{
    public class ListMenuController : BaseController
    {
        // GET: ListMenu
        public ActionResult ListMenu()
        {
            List<LoaiSanPhamDTO> list = LoaiSanPham_Service.GetAll();
            return View(list);
        }
    }
}