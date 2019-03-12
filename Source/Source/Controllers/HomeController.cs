using DAO;
using Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLogic;
using System.Data;

namespace Source.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            List<LoaiChiPhiDAO> data = new LoaiChiPhiBL().GetByID(6);
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}