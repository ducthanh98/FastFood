using BusinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Source.Controllers
{
    public class BaseController : Controller
    {
        protected LoaiChiPhiBL LoaiChiPhi_Service = new LoaiChiPhiBL();
    }
}