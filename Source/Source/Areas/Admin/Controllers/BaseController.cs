using BusinessLogic;
using Source.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Source.Areas.Admin.Controllers
{
    [AuthorizeBusinessLogic]
    public class BaseController : Controller
    {
        protected KhuyenMaiBL KhuyenMai_Service = new KhuyenMaiBL();
        protected LoaiChiPhiBL LoaiChiPhi_Service = new LoaiChiPhiBL();
        protected ChiPhiBL ChiPhi_Service = new ChiPhiBL();
        protected ChiNhanhBL ChiNhanh_Service = new ChiNhanhBL();
        protected TaiKhoanBL TaiKhoan_Service = new TaiKhoanBL();
        protected SanPhamBL SanPham_Service = new SanPhamBL();
        protected LoaiSanPhamBL LoaiSanPham_Service = new LoaiSanPhamBL();
        protected ComboBL Combo_Service = new ComboBL();
        protected ReportBL Report_Service = new ReportBL();



    }
}