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

        public List<TaiKhoanDAO> GetAllBy(int pageNumber, int pageSize, string keyText,out int totalEntries)
        {
            throw new NotImplementedException();
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
            throw new NotImplementedException();
        }

        public bool Update(TaiKhoanDAO obj)
        {
            throw new NotImplementedException();
        }
        public TaiKhoanDAO checkExistAcc(string TenTaiKhoan,string MatKhau)
        {
            return new SqlHelper<TaiKhoanDAO>().ExecuteProcAndGetData("CTTaiKhoan_CheckExistLogin", TenTaiKhoan, MatKhau);
        }
    }
}
