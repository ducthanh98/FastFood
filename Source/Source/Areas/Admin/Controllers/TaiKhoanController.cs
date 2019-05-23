using DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Source.Areas.Admin.Controllers
{
    public class TaiKhoanController : BaseController
    {
        // GET: TaiKhoan
        public ActionResult DanhSach()
        {
            TempData.Clear();
            return View();
        }

        public PartialViewResult _DanhSach(int pageNumber = 1, int pageSize = 10, string keyText = "")
        {
            List<TaiKhoanDAO> list = new List<TaiKhoanDAO>();
            try
            {
                int quyenHan = ((TaiKhoanDAO)HttpContext.Session["User"]).QuyenHan;
                int totalEntries;
                list = TaiKhoan_Service.GetAllBy(pageNumber, pageSize, keyText, out totalEntries,quyenHan);
                ViewBag.maxNumber = Math.Ceiling(totalEntries / (double)pageSize);
                ViewBag.pageNumber = pageNumber;
                ViewBag.pageSize = pageSize;
                TempData["Users"] = list;
                TempData["Boxes"] = ChiNhanh_Service.GetAll();
                TempData.Keep();

            }
            catch (Exception e)
            {
                throw e;
            }
            return PartialView(list);
        }
        public PartialViewResult _ChiTiet(int ID)
        {
            TaiKhoanDAO user;
            try
            {
                List<TaiKhoanDAO> Users = (List<TaiKhoanDAO>)TempData["Users"];
                TempData.Keep();
                user = Users.Where(x => x.MaTaiKhoan.Equals(ID)).FirstOrDefault();
                if (user == null)
                {
                    user = new TaiKhoanDAO();
                }
            }
            catch (Exception e)
            {
                throw e;
            }

            return PartialView(user);
        }
    }
}