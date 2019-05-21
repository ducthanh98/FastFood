using DTO;
using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Linq;
using System.Collections;
using DAO;

namespace Source.Areas.Admin.Controllers
{
    public class ChiPhiController : BaseController
    {
        // GET: Admin/ChiPhi
        public ActionResult DanhSachChiPhi()
        {
            TempData.Clear();
            return View();
        }

        public PartialViewResult _DanhSachChiPhi(int pageNumber = 1, int pageSize = 10, string keyText = "")
        {
            List<ChiPhiDAO> chiPhi = new List<ChiPhiDAO>();
            try
            { 
                List<LoaiChiPhiDAO> loaiChiPhi = LoaiChiPhi_Service.GetAll();
                Hashtable hs = new Hashtable();
                for (int i = 0; i < loaiChiPhi.Count; i++)
                {
                    hs.Add(loaiChiPhi[i].MaLoaiChiPhi, loaiChiPhi[i].TenLoaiChiPhi);
                }
                ViewBag.dsLoaiChiPhi = hs;

                int totalEntries;
                chiPhi = ChiPhi_Service.GetAllBy(pageNumber, pageSize, keyText, out totalEntries);
                ViewBag.maxNumber = Math.Ceiling(totalEntries / (double)pageSize);
                ViewBag.pageNumber = pageNumber;
                ViewBag.pageSize = pageSize;
                TempData["loaiChiPhi"] = loaiChiPhi;
                TempData["chiPhi"] = chiPhi;
                TempData.Keep();
            }
            catch (Exception e)
            {
                throw e;
            }
            return PartialView(chiPhi);
        }

        public PartialViewResult _ChiPhi_ChiTiet(int ID)
        { 
            ChiPhiDAO data;
            try
            {
                List<ChiPhiDAO> chiPhi = (List<ChiPhiDAO>)TempData["chiPhi"];
                TempData.Keep();
                data = chiPhi.Where(x => x.MaChiPhi.Equals(ID)).FirstOrDefault();
                if (data == null)
                {
                    data = new ChiPhiDAO();
                }
            }
            catch (Exception e)
            {
                throw e;
            }

            return PartialView(data);
        }

        public ActionResult DanhSachLoaiChiPhi()
        {
            TempData.Clear();
            return View();
        }


        public PartialViewResult _DanhSachLoaiChiPhi(int pageNumber =1,int pageSize =10,string keyText ="")
        {
            List<LoaiChiPhiDAO> list = new List<LoaiChiPhiDAO>();
            try
            {
                List<ChiNhanhDTO> listBoxes = ChiNhanh_Service.GetAll();
                Hashtable hs = new Hashtable();
                for(int i = 0; i < listBoxes.Count; i++)
                {
                    hs.Add(listBoxes[i].MaChiNhanh, listBoxes[i].TenChiNhanh);
                }
                ViewBag.listboxes = hs;
                int totalEntries;
                list = LoaiChiPhi_Service.GetAllBy(pageNumber, pageSize, keyText,out totalEntries);
                ViewBag.maxNumber = Math.Ceiling(totalEntries / (double)pageSize);
                ViewBag.pageNumber = pageNumber;
                ViewBag.pageSize = pageSize;
                TempData["ExpenseType"] = list;
                TempData["Boxes"] = listBoxes;
                TempData.Keep();
            }
            catch (Exception e)
            {
                throw e;
            }
            return PartialView(list);
        }

        public PartialViewResult _LoaiChiPhi_ChiTiet(int ID)
        {
            LoaiChiPhiDAO data;
            try
            {
                List <LoaiChiPhiDAO> list = (List<LoaiChiPhiDAO>)TempData["ExpenseType"];
                TempData.Keep();
                data = list.Where(x => x.MaLoaiChiPhi.Equals(ID)).FirstOrDefault();
                if(data == null)
                {
                    data = new LoaiChiPhiDAO();
                }
            } catch(Exception e)
            {
                throw e;
            }
            
            return PartialView(data);
        }


    }
}