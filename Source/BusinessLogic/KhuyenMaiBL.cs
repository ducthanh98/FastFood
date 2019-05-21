using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using Common;

namespace BusinessLogic
{
    public class KhuyenMaiBL : BusinessLogic<KhuyenMaiDAO>
    {
        public bool Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public List<KhuyenMaiDAO> GetAllBy(int pageNumber, int pageSize, string keyText, out int totalEntries)
        {
            throw new NotImplementedException();
        }

        public KhuyenMaiDAO GetByID(int ID)
        {
            throw new NotImplementedException();
        }

        public bool Insert(KhuyenMaiDAO obj)
        {
            throw new NotImplementedException();
        }

        public bool Update(KhuyenMaiDAO obj)
        {
            throw new NotImplementedException();
        }

        public List<KhuyenMaiDAO> GetAll()
        {
            return new SqlHelper<KhuyenMaiDAO>().ExecuteProcAndGetData("CTKhuyenMai_SelectAll");
        }
    }
}
