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

        public PartialViewResult _Combo(int pageNumber = 1, int pageSize = 10, string keyText = "")
        {
            List<Combo_SanPham> list = new List<Combo_SanPham>();
            try
            {
                int totalEntries;
                list = Combo_Service.REL_GetAllBy(pageNumber, pageSize, keyText, out totalEntries);

                ViewBag.maxNumber = Math.Ceiling(totalEntries / (double)pageSize);
                ViewBag.pageNumber = pageNumber;
                ViewBag.pageSize = pageSize;
            }
            catch (Exception e)
            {
                throw e;
            }
            return PartialView(list);
        }
        public ActionResult Combo_ChiTiet(int ID=0)
        {
            Combo_SanPham combo_sanPham = new Combo_SanPham();
            if (ID != 0)
            {
                combo_sanPham = Combo_Service.SelectByPrimaryKey(ID);

            }
            String selectHtml = "";
            List<SanPham_TypeInsertCombo> dsSanPham = SanPham_Service.SelectAllForCombo();
            for(int i = 0; i < dsSanPham.Count; i++)
            {
                selectHtml += "<option value='" + dsSanPham[i].MaSanPham + "'>" + dsSanPham[i].TenSanPham + "</option>";
            }
            ViewBag.dsSanPham = dsSanPham;
            ViewBag.selectTag = selectHtml;
            return View(combo_sanPham);
        }
    }
}