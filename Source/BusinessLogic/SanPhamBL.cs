using Common;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class SanPhamBL : BusinessLogic<SanPhamDTO>
    {
        public bool Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public List<SanPhamDTO> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<SanPhamDTO> GetAllBy(int pageNumber, int pageSize, string keyText, out int totalEntries)
        {
            return new SqlHelper<SanPhamDTO>().ExecuteProcAndGetData("CTSanPham_GetAllBy", pageNumber, pageSize, keyText, out totalEntries);
        }

        public int GetAllEntries()
        {
            throw new NotImplementedException();
        }

        public SanPhamDTO GetByID(int ID)
        {
            throw new NotImplementedException();
        }

        public bool Insert(SanPhamDTO obj)
        {
            return new SqlHelper<SanPhamDTO>().ExecuteProc("CTSanPham_Insert", obj);

        }

        public bool Update(SanPhamDTO obj)
        {
            return new SqlHelper<SanPhamDTO>().ExecuteProc("CTSanPham_Update", obj);
        }
    }
}
