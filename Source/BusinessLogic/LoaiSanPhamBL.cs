using Common;
using DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class LoaiSanPhamBL : BusinessLogic<LoaiSanPhamDAO>
    {
        public bool Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public List<LoaiSanPhamDAO> GetAll()
        {
            return new SqlHelper<LoaiSanPhamDAO>().ExecuteProcAndGetData("CTLoaiSanPham_SelectAll");
        }

        public List<LoaiSanPhamDAO> GetAllBy(int pageNumber, int pageSize, string keyText, out int totalEntries)
        {
            return new SqlHelper<LoaiSanPhamDAO>().ExecuteProcAndGetData("CTLoaiSanPham_GetAllBy", pageNumber, pageSize, keyText, out totalEntries);

        }

        public int GetAllEntries()
        {
            throw new NotImplementedException();
        }

        public LoaiSanPhamDAO GetByID(int ID)
        {
            throw new NotImplementedException();
        }

        public bool Insert(LoaiSanPhamDAO obj)
        {
            return new SqlHelper<LoaiSanPhamDAO>().ExecuteProc("CTLoaiSanPham_Insert", obj);
        }

        public bool Update(LoaiSanPhamDAO obj)
        {
            return new SqlHelper<LoaiSanPhamDAO>().ExecuteProc("CTLoaiSanPham_Update", obj);
        }
       
    }
}
