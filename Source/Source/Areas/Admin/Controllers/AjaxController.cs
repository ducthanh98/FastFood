using Common;
using DAO;
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
                    Result.Message = fileName;
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
        public JsonResult addOrUpdateExpenseType(LoaiChiPhiDAO obj,bool isUpdate)
        {
            AjaxResultModel Result = new AjaxResultModel();
            string messageErr = "";
            bool check = true;
            try
            {
                if (!ModelState.IsValid)
                {
                    check = false;
                    messageErr = string.Join("; ", ModelState.Values
                                        .SelectMany(x => x.Errors)
                                        .Select(x => x.ErrorMessage));
                }
                else if (isUpdate)
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
                    Result.Message = messageErr == "" ? "Đã có lỗi xảy ra. Vui lòng thử lại." : messageErr;
                }
            }
            catch (Exception e)
            {
                Result.Code = 2;
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
                Result.Code = 2;
                Result.Message = e.Message;
                //throw;
            }
            return Json(new JsonResult() { Data = Result });
        }
        #endregion ExpenseType


        #region PRODUCT
        public JsonResult addOrUpdateProduct(SanPhamDAO obj, bool isUpdate)
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

        public JsonResult addOrUpdateCombo(Combo_Insert obj, bool isUpdate)
        {
            AjaxResultModel Result = new AjaxResultModel();

            bool check = true;
            try
            {
                if (isUpdate)
                {
                    check = Combo_Service.Update(obj);
                }
                else
                {
                    check = Combo_Service.Insert(obj);
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

        #endregion

        #region Expense
        public JsonResult addOrUpdateExpense(ChiPhiDAO obj, bool isUpdate)
        {
            AjaxResultModel Result = new AjaxResultModel();

            bool check = true;
            try
            {
                if (isUpdate)
                {
                    check = ChiPhi_Service.Update(obj);
                }
                else
                {
                    obj.NgayTao = DateTime.Now;
                    check = ChiPhi_Service.Insert(obj);
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
        #endregion Expense

        #region Product Type
        public JsonResult addOrUpdateProductType(LoaiSanPhamDAO obj, bool isUpdate)
        {
            AjaxResultModel Result = new AjaxResultModel();

            bool check = true;
            try
            {
                if (isUpdate)
                {
                    check = LoaiSanPham_Service.Update(obj);
                }
                else
                {
                    check = LoaiSanPham_Service.Insert(obj);
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
        #endregion Product type

        #region Promotion
        public JsonResult addOrUpdatePromotion(KhuyenMaiDAO obj, bool isUpdate)
        {
            AjaxResultModel Result = new AjaxResultModel();

            bool check = true;
            try
            {
                if (isUpdate)
                {
                    check = KhuyenMai_Service.Update(obj);
                }
                else
                {
                    check = KhuyenMai_Service.Insert(obj);
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

        #endregion Promotion

        #region Users
        public JsonResult addOrUpdateUsers(TaiKhoanDAO obj, bool isUpdate)
        {
            AjaxResultModel Result = new AjaxResultModel();

            bool check = true;
            try
            {
                TaiKhoanDAO user  = ((TaiKhoanDAO)HttpContext.Session["User"]);
                if(user.QuyenHan > obj.QuyenHan)
                {
                    Result.Code = 2;
                    Result.Message = "Bạn không thể tạo tài khoản vượt quyền hạn";
                    return Json(new JsonResult() { Data = Result });
                } 

                if (isUpdate && obj.MaTaiKhoan == 1 && obj.QuyenHan != 0)
                {
                    Result.Code = 3;
                    Result.Message = "Bạn không thể chỉnh sửa quyền hạn tài khoản cấp cao nhất";
                    return Json(new JsonResult() { Data = Result });

                } else if (isUpdate){
                    check = TaiKhoan_Service.Update(obj);
                }
                else
                {
                    check = TaiKhoan_Service.Insert(obj);
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
                Result.Code = 999;
                Result.Message = e.Message;
                //throw;
            }
            return Json(new JsonResult() { Data = Result });
        }

        #endregion Users

    }
}