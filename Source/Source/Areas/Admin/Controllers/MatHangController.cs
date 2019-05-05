using DTO;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Source.Areas.Admin.Controllers
{
    public class MatHangController : BaseController
    {
        // GET: Admin/MatHang
        public ActionResult SanPham()
        {

            return View();
        }
        public PartialViewResult _SanPham(int pageNumber =1,int pageSize =10,string keyText="")
        {
            List<SanPhamDTO> list = new List<SanPhamDTO>();
            try
            {
                List<LoaiSanPhamDTO> productType = LoaiSanPham_Service.GetAll();
                Hashtable hs = new Hashtable();
                for (int i = 0; i < productType.Count; i++)
                {
                    hs.Add(productType[i].MaLoaiSanPham, productType[i].TenLoaiSanPham);
                }
                ViewBag.listboxes = hs;
                int totalEntries;
                list = SanPham_Service.GetAllBy(pageNumber, pageSize, keyText, out totalEntries);
                ViewBag.maxNumber = Math.Ceiling(totalEntries / (double)pageSize);
                ViewBag.pageNumber = pageNumber;
                ViewBag.pageSize = pageSize;
                TempData["products"] = list;
                TempData["productType"] = productType;
                TempData.Keep();
            }
            catch (Exception e)
            {
                throw e;
            }
            return PartialView(list);
        }

        public PartialViewResult _SanPham_ChiTiet(int ID)
        {
            List<SanPhamDTO> products = (List<SanPhamDTO>)TempData["products"];
            TempData.Keep();
            SanPhamDTO product = products.Where(x => x.MaSanPham.Equals(ID)).FirstOrDefault();
            if(product == null)
            {
                product = new SanPhamDTO();
            } 
            return PartialView(product);
        }

        public ActionResult Combo()
        {
            return View();
        }
    }
}