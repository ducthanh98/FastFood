using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAO;
using Source.Areas.Admin.Controllers;

namespace Source.Controllers
{
    public class GioHangController : BaseController
    {
        // GET: GioHang
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult GioHang_ChiTiet()
        {
            List<GioHang> giohang = Session["giohang"] as List<GioHang>;
            return PartialView(giohang);
        }

        public bool GetSP(int MaMatHang, bool laSanPham, int soLuong)
        {
            if (Session["giohang"] == null)
            {
                Session["giohang"] = new List<GioHang>();
            }
            List<GioHang> giohang = Session["giohang"] as List<GioHang>;
            if (laSanPham == false)
            {
                if (giohang.FirstOrDefault(x =>(x.cb != null && x.cb.MaCombo == MaMatHang)) == null)
                {
                    giohang.Add(new GioHang { cb = Combo_Service.SelectByPrimaryKey(MaMatHang), SoLuong = soLuong });
                }
                else
                {
                    GioHang item = giohang.FirstOrDefault(x =>(x.cb!= null && x.cb.MaCombo == MaMatHang));
                    item.SoLuong += soLuong;
                }
            }
            else
            {
                if (giohang.FirstOrDefault(x =>(x.sp != null && x.sp.MaSanPham == MaMatHang)) == null)
                {
                    giohang.Add(new GioHang { sp = SanPham_Service.GetByID(MaMatHang), SoLuong = soLuong });
                }
                else
                {
                    GioHang item = giohang.FirstOrDefault(x =>(x.sp != null && x.sp.MaSanPham == MaMatHang));
                    item.SoLuong += soLuong;
                }

            }
            return true;
        }

        //public bool XoaGioHang(int MaMatHang, bool laSanPham)
        //{
        //    List<GioHang> giohang = Session["giohang"] as List<GioHang>;
        //    if(laSanPham == false)
        //    {
        //        GioHang item = giohang.FirstOrDefault(x => (x.cb != null && x.cb.MaCombo == MaMatHang));
        //        if(item !=null)
        //        {
        //            giohang.Remove(item);
        //        }   
        //    }
        //    else
        //    {
        //        GioHang item = giohang.FirstOrDefault(x => (x.sp != null && x.sp.MaSanPham == MaMatHang));
        //        if (item != null)
        //        {
        //            giohang.Remove(item);
        //        }
        //    }          
        //    return true;
        //}
    }
}


