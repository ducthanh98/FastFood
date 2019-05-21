using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using Common;

namespace BusinessLogic
{
    public class TaiKhoanBL
    {
        public bool Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public List<TaiKhoanDTO> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<TaiKhoanDTO> GetAllBy(int pageNumber, int pageSize, string keyText,out int totalEntries)
        {
            throw new NotImplementedException();
        }

        public int GetAllEntries()
        {
            throw new NotImplementedException();
        }

        public TaiKhoanDTO GetByID(int ID)
        {
            throw new NotImplementedException();
        }

        public bool Insert(TaiKhoanDTO obj)
        {
            throw new NotImplementedException();
        }

        public bool Update(TaiKhoanDTO obj)
        {
            throw new NotImplementedException();
        }
        public TaiKhoanDTO checkExistAcc(string TenTaiKhoan,string MatKhau)
        {
            return new SqlHelper<TaiKhoanDTO>().ExecuteProcAndGetData("CTTaiKhoan_CheckExistLogin", TenTaiKhoan, MatKhau);
        }
    }
}
