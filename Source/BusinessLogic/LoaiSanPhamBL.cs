using Common;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class LoaiSanPhamBL : BusinessLogic<LoaiSanPhamDTO>
    {
        public bool Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public List<LoaiSanPhamDTO> GetAll()
        {
            return new SqlHelper<LoaiSanPhamDTO>().ExecuteProcAndGetData("CTLoaiSanPham_SelectAll");
        }

        public List<LoaiSanPhamDTO> GetAllBy(int pageNumber, int pageSize, string keyText, out int totalEntries)
        {
            throw new NotImplementedException();
        }

        public int GetAllEntries()
        {
            throw new NotImplementedException();
        }

        public LoaiSanPhamDTO GetByID(int ID)
        {
            throw new NotImplementedException();
        }

        public bool Insert(LoaiSanPhamDTO obj)
        {
            throw new NotImplementedException();
        }

        public bool Update(LoaiSanPhamDTO obj)
        {
            throw new NotImplementedException();
        }
    }
}
