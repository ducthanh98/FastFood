using DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Source.Areas.Admin.Controllers
{
    public class HomeController : BaseController
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            List<ChartReport> lstChart = new List<ChartReport>();
            try
            {
                TaiKhoanDAO taiKhoan = (TaiKhoanDAO)System.Web.HttpContext.Current.Session["User"];
                lstChart = Report_Service.DataForChart(taiKhoan.MaChiNhanh);
            } catch(Exception e)
            {
                throw e;
            }
            return View(lstChart);
        }

        [ChildActionOnly]
        public ActionResult _Header()
        {

            return View();
        }
        [ChildActionOnly]
        public ActionResult _Menu()
        {
            return View();
        }
        [ChildActionOnly]
        public PartialViewResult _Pagination(int maxNumber, int pageNumber)
        {
            ViewBag.maxNumber = maxNumber;
            ViewBag.pageNumber = pageNumber;
            return PartialView();
        }
    }
}