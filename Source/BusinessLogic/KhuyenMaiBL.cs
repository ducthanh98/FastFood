using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using Common;

namespace BusinessLogic
{
    public class KhuyenMaiBL : BusinessLogic<KhuyenMaiDTO>
    {
        public bool Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public List<KhuyenMaiDTO> GetAllBy(int pageNumber, int pageSize, string keyText, out int totalEntries)
        {
            throw new NotImplementedException();
        }

        public KhuyenMaiDTO GetByID(int ID)
        {
            throw new NotImplementedException();
        }

        public bool Insert(KhuyenMaiDTO obj)
        {
            throw new NotImplementedException();
        }

        public bool Update(KhuyenMaiDTO obj)
        {
            throw new NotImplementedException();
        }

        public List<KhuyenMaiDTO> GetAll()
        {
            return new SqlHelper<KhuyenMaiDTO>().ExecuteProcAndGetData("CTKhuyenMai_SelectAll");
        }
    }
}
