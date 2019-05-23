using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using Common;

namespace BusinessLogic
{
    public class TaiKhoanBL
    {
        public bool Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public List<TaiKhoanDAO> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<TaiKhoanDAO> GetAllBy(int pageNumber, int pageSize, string keyText,out int totalEntries,int QuyenHan)
        {
            return new SqlHelper<TaiKhoanDAO>().ExecuteProcAndGetData("CTTaiKhoan_GetAllBy", pageNumber, pageSize, keyText, out totalEntries,QuyenHan,"QuyenHan");
        }

        public int GetAllEntries()
        {
            throw new NotImplementedException();
        }

        public TaiKhoanDAO GetByID(int ID)
        {
            throw new NotImplementedException();
        }

        public bool Insert(TaiKhoanDAO obj)
        {
            return new SqlHelper<TaiKhoanDAO>().ExecuteProc("CTTaiKhoan_Insert", obj);

        }

        public bool Update(TaiKhoanDAO obj)
        {
            return new SqlHelper<TaiKhoanDAO>().ExecuteProc("CTUpdate_Insert", obj);
        }
        public TaiKhoanDAO checkExistAcc(string TenTaiKhoan,string MatKhau)
        {
            return new SqlHelper<TaiKhoanDAO>().ExecuteProcAndGetData("CTTaiKhoan_CheckExistLogin", TenTaiKhoan, MatKhau);
        }
    }
}
