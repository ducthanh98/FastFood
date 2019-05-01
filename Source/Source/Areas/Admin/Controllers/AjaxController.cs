using Common;
using DTO;
using Source.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Source.Areas.Admin.Controllers
{
    public class AjaxController : BaseController
    {
        public JsonResult UploadFile(HttpPostedFileBase file)
        {
            AjaxResultModel Result = new AjaxResultModel();
            try
            {
                if (file.ContentLength > 0)
                {
                    string fileName = DateTime.Now.Ticks.ToString()+Path.GetFileName(file.FileName);
                    string path = Path.Combine(Server.MapPath(AppConfig.uploadFolder), fileName);
                    file.SaveAs(path);
                    Result.Code = 0;
                    Result.Message = AppConfig.uploadFolder+fileName;
                }
            }
            catch (Exception e)
            {
                Result.Code = 1;
                Result.Message = "Đã xảy ra lỗi !";
            }
            return Json(new JsonResult() { Data = Result });

        }
        #region ExpenseType
        public JsonResult addOrUpdateExpenseType(LoaiChiPhiDTO obj,bool isUpdate)
        {
            AjaxResultModel Result = new AjaxResultModel();

            bool check = true;
            try
            {
                if (isUpdate)
                {
                    check = LoaiChiPhi_Service.Update(obj);
                }
                else
                {
                    check = LoaiChiPhi_Service.Insert(obj);
                }
                if (check)
                {
                    Result.Code = 0;
                    Result.Message = "Thành công";
                }
                else
                {
                    Result.Code = 1;
                    Result.Message = "Đã có lỗi xảy ra. Vui lòng thử lại.";
                }
            }
            catch (Exception e)
            {
                Result.Code = 1;
                Result.Message = e.Message;
                //throw;
            }
            return Json(new JsonResult() { Data = Result });
        }
        public JsonResult DeleteExpenseType(int ID)
        {
            AjaxResultModel Result = new AjaxResultModel();

            bool check = true;
            try
            {
                check = LoaiChiPhi_Service.Delete(ID);
                if (check)
                {
                    Result.Code = 0;
                    Result.Message = "Thành công";
                }
                else
                {
                    Result.Code = 1;
                    Result.Message = "Đã có lỗi xảy ra. Vui lòng thử lại.";
                }
            }
            catch (Exception e)
            {
                Result.Code = 1;
                Result.Message = e.Message;
                //throw;
            }
            return Json(new JsonResult() { Data = Result });
        }
        #endregion ExpenseType
        #region BOXES
        public bool addOrUpdateBoxes(ChiNhanhDTO obj,bool isUpdate)
        {
            bool check = true;
            try
            {
                if (isUpdate)
                {
                     check = ChiNhanh_Service.Update(obj);
                } else
                {
                    check = ChiNhanh_Service.Insert(obj);
                }

            } catch(Exception e)
            {
                throw e;
            }
            return check;
        }

        public bool DeleteBoxes(int ID)
        {
            bool check = true;
            try
            {
                check = ChiNhanh_Service.Delete(ID);
            }
            catch (Exception e)
            {
                throw e;
            }
            return check;
        }

        #endregion BOXES

        #region PRODUCT
        public JsonResult addOrUpdateProduct(SanPhamDTO obj, bool isUpdate)
        {
            AjaxResultModel Result = new AjaxResultModel();

            bool check = true;
            try
            {
                if (isUpdate)
                {
                    check = SanPham_Service.Update(obj);
                }
                else
                {
                    check = SanPham_Service.Insert(obj);
                }
                if (check)
                {
                    Result.Code = 0;
                    Result.Message = "Thành công";
                }
                else
                {
                    Result.Code = 1;
                    Result.Message = "Đã có lỗi xảy ra. Vui lòng thử lại.";
                }
            }
            catch (Exception e)
            {
                Result.Code = 1;
                Result.Message = e.Message;
                //throw;
            }
            return Json(new JsonResult() { Data = Result });
        }
        public JsonResult DeleteProduct(int ID)
        {
            AjaxResultModel Result = new AjaxResultModel();

            bool check = true;
            try
            {
                check = SanPham_Service.Delete(ID);
                if (check)
                {
                    Result.Code = 0;
                    Result.Message = "Thành công";
                }
                else
                {
                    Result.Code = 1;
                    Result.Message = "Đã có lỗi xảy ra. Vui lòng thử lại.";
                }
            }
            catch (Exception e)
            {
                Result.Code = 1;
                Result.Message = e.Message;
                //throw;
            }
            return Json(new JsonResult() { Data = Result });
        }
        #endregion
        public bool test()
        {
            try
            {
                ChiNhanhDTO dto = ChiNhanh_Service.GetByID(1002);
            }
            catch (Exception e)
            {
                throw e;
            }
            return true;
        }

    }
}