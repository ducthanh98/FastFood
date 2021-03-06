﻿using DAO;
using Source.Configuration;
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
            TempData.Clear();
            return View();
        }
        public PartialViewResult _SanPham(int pageNumber =1,int pageSize =10,string keyText="")
        {
            List<SanPhamDAO> list = new List<SanPhamDAO>();
            try
            {
                List<LoaiSanPhamDAO> productType = LoaiSanPham_Service.GetAll();
                Hashtable hs = new Hashtable();
                for (int i = 0; i < productType.Count; i++)
                {
                    hs.Add(productType[i].MaLoaiSanPham, productType[i].TenLoaiSanPham);
                }
                ViewBag.listProductTypes = hs;
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
            List<SanPhamDAO> products = (List<SanPhamDAO>)TempData["products"];
            TempData.Keep();
            SanPhamDAO product = products.Where(x => x.MaSanPham.Equals(ID)).FirstOrDefault();
            if(product == null)
            {
                product = new SanPhamDAO();
            } 
            return PartialView(product);
        }

        public ActionResult Combo()
        {
            TempData.Clear();
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
            ViewBag.MaCombo = ID;
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

        public ActionResult LoaiSanPham()
        {
            TempData.Clear();
            return View();
        }
        public PartialViewResult _LoaiSanPham(int pageNumber = 1, int pageSize = 10, string keyText = "")
        {
            List<LoaiSanPhamDAO> list = new List<LoaiSanPhamDAO>();
            try
            {

                int totalEntries;
                list = LoaiSanPham_Service.GetAllBy(pageNumber, pageSize, keyText, out totalEntries);
                ViewBag.maxNumber = Math.Ceiling(totalEntries / (double)pageSize);
                ViewBag.pageNumber = pageNumber;
                ViewBag.pageSize = pageSize;
                TempData["productType"] = list;
                TempData.Keep();
            }
            catch (Exception e)
            {
                throw e;
            }
            return PartialView(list);
        }

        public PartialViewResult _LoaiSanPham_ChiTiet(int ID)
        {
            LoaiSanPhamDAO productType;
            try
            {
                List<LoaiSanPhamDAO> productTypes = (List<LoaiSanPhamDAO>)TempData["productType"];
                TempData.Keep();
                productType = productTypes.Where(x => x.MaLoaiSanPham.Equals(ID)).FirstOrDefault();
                if (productType == null)
                {
                    productType = new LoaiSanPhamDAO();
                }
            } catch(Exception e)
            {
                throw e;
            }
            return PartialView(productType);
        }



    }
}